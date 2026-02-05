FROM ubuntu:22.04

ARG INSTALLER_FILE

ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Dependencies
RUN apt-get update && apt-get install -y \
    cups \
    cups-pdf \
    libcups2 \
    sudo \
    wget \
    unzip \
    tar \
    gettext \
    iputils-ping \
    usbutils \
    supervisor \
    postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Create Users
RUN useradd -m -s /bin/bash savapage && \
    usermod -aG sudo savapage && \
    usermod -aG lpadmin savapage && \
    echo "savapage:savapage" | chpasswd

# 3. Enable Remote Admin for CUPS (Prepare config)
RUN /usr/sbin/cupsd && \
    /usr/sbin/cupsctl --remote-any --share-printers && \
    service cups stop

# --- WICHTIG: Backup der Config erstellen ---
# Da wir /etc/cups später überschreiben (Mount), sichern wir das Original hier.
RUN cp -rp /etc/cups /etc/cups-orig

# 4. Install SavaPage
COPY ${INSTALLER_FILE} /tmp/savapage-setup.bin
RUN chmod +x /tmp/savapage-setup.bin && \
    # Run installer as savapage user but allow root tasks via sudo
    sudo -u savapage /tmp/savapage-setup.bin -n && \
    rm /tmp/savapage-setup.bin

# 5. Setup Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose Ports
EXPOSE 631 8631

# Start via Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

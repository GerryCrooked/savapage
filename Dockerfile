FROM debian:bookworm

# Install dependencies
RUN apt update && apt install --no-install-recommends --no-install-suggests -y \
    binutils cpio cups cups-bsd debianutils default-jdk-headless gzip imagemagick \
    librsvg2-bin perl poppler-utils qpdf supervisor wkhtmltopdf libheif-examples \
    vim-tiny findutils apt-utils iputils-ping gnupg curl hplip wget nano usbutils procps

# Copy supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create user
RUN useradd -rmd /opt/savapage -s /bin/bash -G lpadmin savapage && \
    chown savapage:savapage /opt/savapage && \
    echo 'savapage:savapage' | chpasswd

USER savapage

# --- DYNAMIC INSTALLER ---
# INSTALLER_FILE argument is passed from build.sh
ARG INSTALLER_FILE
COPY ./${INSTALLER_FILE} /opt/savapage/savapage-setup.bin
# -------------------------

# Run setup
RUN ["bash", "/opt/savapage/savapage-setup.bin", "-n"]

USER root
# Run root tasks (PAM, etc.)
RUN ["/opt/savapage/server/bin/linux-x64/roottasks", "pam"]

# Expose ports (mapped in docker-compose)
EXPOSE 631 8631

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

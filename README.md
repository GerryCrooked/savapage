# SavaPage Docker Deployment

This repository provides an automated build and deployment system for the SavaPage Open Print Management solution using Docker. It orchestrates a PostgreSQL database and a custom SavaPage container.

The core component is the `installer.sh` script, which handles the download, configuration, image building, and container orchestration. It also features interactive hardware detection for USB printers.

## License

Distributed under the MIT License. See `LICENSE` for more information.

### Disclaimer
Please note that the MIT License applies **only** to the deployment scripts and configuration files in this repository.

* **SavaPage:** Proprietary software subject to the SavaPage EULA.
* **CUPS:** Licensed under Apache 2.0 / GPL.
* **PostgreSQL:** Licensed under the PostgreSQL License.

## Features

* **Interactive Setup:** A master script queries for version, ports, passwords, and storage locations.
* **USB Printer Passthrough:** Automatically scans the host USB bus, detects connected printers, and injects the specific device paths into the container configuration.
* **Dynamic Configuration:** Automatically generates `docker-compose.yml` and `.env` files based on your specific hardware and preferences.
* **PostgreSQL Integration:** Automatically configures an external PostgreSQL container.
* **Data Persistence:** Uses local bind mounts for easy backup and access to data.

## Prerequisites

* A Linux server (Debian/Ubuntu recommended).
* Docker installed.
* Docker Compose installed (either the `docker compose` plugin or standalone `docker-compose`).
* `wget` installed (for downloading the installer).
* `usbutils` (optional, required for USB printer detection). The script will offer to install this if missing.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/GerryCrooked/savapage.git
    cd savapage
    ```

2.  **Make the script executable:**
    ```bash
    chmod +x installer.sh
    ```

3.  **Run the deployment master script:**
    ```bash
    ./installer.sh
    ```

4.  **Follow the interactive prompts:**
    * Select the SavaPage version.
    * Define network ports.
    * Set database passwords.
    * Define the storage path for persistent data.
    * **USB Setup:** If you wish to use local USB printers, confirm the prompt. Select the devices from the list to pass them through to the container.

## Version Control Note

**Do not commit** the generated `docker-compose.yml` or `.env` files to your version control system.

The `installer.sh` script generates these files dynamically because USB device paths (e.g., `/dev/bus/usb/001/004`) change between different servers and reboots. The `docker-compose.yml` is now a build artifact, not a static configuration file.

**Files to track in Git:**
* `installer.sh`
* `Dockerfile`
* `init-savapage.sql`
* `supervisord.conf`
* `README.md`
* `.gitignore`

## Configuration Details

### Storage
The script prompts for a storage location (default: `./volumes`). It creates the following directory structure on the host:
* `/database`: PostgreSQL database files.
* `/data`: Internal SavaPage data.
* `/custom`: Custom configuration files.
* `/ext`: Extensions.
* `/logs`: Application logs.
* `/cups`: CUPS configuration.

### USB Printers
If USB support is enabled, the script uses `lsusb` to map host device paths to the container. If you unplug and replug a printer to a different port, or if the host reboots and assigns different bus numbers, you may need to rerun `./installer.sh` to regenerate the configuration with the new paths.

## Accessing the Application

Once the deployment finishes, the script will output the specific URLs.

* **SavaPage Admin:** `http://<SERVER_IP>:<HTTP_PORT>/admin`
* **CUPS Interface:** `http://<SERVER_IP>:<CUPS_PORT>`

**Default Credentials:**
* SavaPage Web: `admin` / `admin`
* CUPS Backend: `savapage` / `savapage`

## Troubleshooting

* **CUPS Access Denied:** The container is configured to allow remote administration. If you cannot access the CUPS interface, ensure the `supervisord.conf` file is correctly loaded and that the container has fully initialized (this may take 10-15 seconds after start).
* **USB Devices Not Showing:** Ensure the user running the container has permissions to access USB devices on the host, or run the container in privileged mode (though the specific device mapping used here is usually sufficient).

## License

The installation scripts are licensed under the **MIT License**.

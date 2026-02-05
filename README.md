# SavaPage Docker Deployment

This repository provides an automated build and deployment system for the SavaPage Open Print Management solution using Docker and Docker Compose. It orchestrates a PostgreSQL database and a custom SavaPage container, handling the installation process, configuration, and data persistence via a single interactive script.

## Important Licensing Notice

**Please read carefully:**

The MIT License included in this repository applies **exclusively** to the installation scripts (`installer.sh`), Docker configuration files (`Dockerfile`, `docker-compose.yml`), and helper scripts provided within this project.

It **does not** apply to:
* **SavaPage:** This is proprietary software. You must adhere to the SavaPage End User License Agreement (EULA). A trial period or a valid license key is required for operation.
* **CUPS:** The Common Unix Printing System is licensed under the Apache License 2.0 and/or GPL/LGPL.
* **Dependencies:** Any other libraries or binaries installed within the container (e.g., PostgreSQL driver, Java, Debian packages) retain their original licenses.

## Features

* **Interactive Setup:** A master script (`installer.sh`) queries for version, ports, passwords, and storage locations.
* **Automated Build:** Automatically downloads the specified SavaPage installer version and builds a Docker image.
* **PostgreSQL Integration:** Automatically configures an external PostgreSQL container instead of the internal Derby database.
* **Data Persistence:** Uses local bind mounts for easy backup and access to data, configuration, logs, and custom files.
* **Zero-Config Deployment:** Generates a `.env` file and starts the environment automatically.
* **Support for USB Printers:** You can add USB Printers by manually editing the `docker-compose.yml` after the installation.

## Prerequisites

* A Linux server (Debian/Ubuntu recommended).
* Docker installed.
* Docker Compose (plugin `docker compose` or standalone `docker-compose`) installed.
* `wget` installed (for downloading the installer).
* Internet access (to fetch the installer and Docker base images).

## Quick Start

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

4.  **Follow the interactive prompts** to configure your installation.

## Configuration Options

The `installer.sh` script will prompt you for the following information during setup. Pressing `ENTER` will accept the default value shown in brackets.

| Prompt | Default | Description |
| :--- | :--- | :--- |
| **SavaPage Version** | `1.6.0` | The version of the SavaPage installer to download and build. |
| **HTTP Port** | `8631` | The port for the SavaPage Administration Web Interface. |
| **CUPS Port** | `631` | The port for the underlying CUPS management interface. |
| **DB Password** | `savapage` | The password for the PostgreSQL database user. |
| **Storage Path** | `./volumes` | Local path where all data will be persisted. |

### Data Persistence (Storage)

Based on the **Storage Path** you provide (e.g., `/opt/savapage_data`), the script will create the following directory structure on your host machine to ensure data survives container restarts:

* `/database`: PostgreSQL database files.
* `/data`: Internal SavaPage data.
* `/custom`: Custom configuration files and modifications.
* `/ext`: Extensions and external binaries.
* `/logs`: Application logs (Tomcat/Jetty, SavaPage).
* `/cups`: CUPS configuration files (printers.conf, ppd, etc.).

## Accessing the Application

Once the deployment finishes successfully, the script will output the IP address and links to access the services.

* **SavaPage Admin:** `http://<SERVER_IP>:<HTTP_PORT>/admin`
* **CUPS Interface:** `http://<SERVER_IP>:<CUPS_PORT>`

**Default Credentials:**
* SavaPage Admin: `admin` / `admin` (Change this immediately after login)
* CUPS Admin: `admin` / `admin` (or the password you set via `SP_ADMIN_PASS` if configured)

## Manual Re-deployment

The `installer.sh` script generates a `.env` file containing your configuration. If you need to restart the containers with the exact same configuration later, you can use standard Docker Compose commands without running the build script again:

```bash
docker compose up -d

To stop the application:

```bash
docker compose down

Troubleshooting
Database Connection Errors: Ensure the postgres container is healthy. The depends_on directive in docker-compose.yml ensures the database starts before the application, but initialization might take a few seconds on the first run.

Permissions: The build script sets chmod 777 on the storage directory to ensure the container users (postgres and savapage) can write to the bind mounts without UID mapping issues. If you change locations manually, ensure permissions are correct.

SSL/HTTPS: This deployment disables the internal Java KeyStore SSL handling to keep the container lightweight. It is recommended to run this container behind a reverse proxy (e.g., Nginx, Traefik, HAProxy) to handle SSL/TLS termination.

License
This repository script and Docker configuration are licensed under the MIT License.

#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${RED}###############################################${NC}"
echo -e "${RED}###      SavaPage UNINSTALLER & CLEANER     ###${NC}"
echo -e "${RED}###############################################${NC}"
echo ""
echo -e "${YELLOW}⚠️  WARNING: This will delete ALL SavaPage data!${NC}"
echo -e "This includes:"
echo -e "  - Docker Containers and Images"
echo -e "  - Configuration Files (.env, docker-compose.yml)"
echo -e "  - ALL Databases and User Data in configured storage paths"
echo -e "  - System packages installed by the installer (e.g. usbutils)"
echo ""
read -p "Are you absolutely sure you want to proceed? (type 'destroy'): " CONFIRM

if [ "$CONFIRM" != "destroy" ]; then
    echo "Aborted."
    exit 1
fi

echo ""

# 1. Determine Docker Command
if docker compose version >/dev/null 2>&1; then
    DOCKER_CMD="docker compose"
elif docker-compose version >/dev/null 2>&1; then
    DOCKER_CMD="docker-compose"
else
    # Fallback if compose is missing but docker exists
    DOCKER_CMD="docker"
fi

# 2. Stop Containers and Remove Resources
if [ -f "docker-compose.yml" ]; then
    echo -e "🛑 Stopping and removing containers..."
    $DOCKER_CMD down -v --remove-orphans
else
    echo "⚠️  docker-compose.yml not found. Trying to kill by name..."
    docker rm -f savapage_savapage savapage_postgres 2>/dev/null
fi

# 3. Remove Docker Image
echo -e "🗑️  Removing Docker image 'savapage'..."
docker rmi savapage 2>/dev/null

# 4. Remove System Dependencies (if we installed them)
if [ -f ".install_state" ]; then
    if grep -q "INSTALLED_USBUTILS=true" .install_state; then
        echo -e "📦 removing usbutils (installed by installer)..."
        apt-get remove -y usbutils
        apt-get autoremove -y
    fi
fi

# 5. Remove Data Directories
# We try to read the path from .env first
STORAGE_PATH=""
if [ -f ".env" ]; then
    # Load .env variables
    export $(grep -v '^#' .env | xargs)
    STORAGE_PATH=$SP_STORAGE_PATH
fi

# Fallback/Safety Check
if [ -z "$STORAGE_PATH" ]; then
    echo -e "${YELLOW}Could not determine storage path from .env.${NC}"
    read -p "Enter path to delete manually (or leave empty to skip): " MANUAL_PATH
    STORAGE_PATH=$MANUAL_PATH
fi

if [ -n "$STORAGE_PATH" ] && [ "$STORAGE_PATH" != "/" ]; then
    echo -e "🔥 Deleting data directory: ${RED}$STORAGE_PATH${NC}"
    rm -rf "$STORAGE_PATH"
else
    echo "Skipping data directory deletion (path empty or root)."
fi

# 6. Remove Generated Files
echo -e "🧹 Cleaning up local artifacts..."
rm -f .env
rm -f docker-compose.yml
rm -f build.log
rm -f .install_state
rm -f savapage-setup-*.bin

echo ""
echo -e "${GREEN}✅ Uninstallation complete. System is clean.${NC}"

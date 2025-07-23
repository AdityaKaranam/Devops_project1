
#!/bin/bash

# Script to install Docker CE on RHEL/CentOS/Rocky/Alma

set -e

echo "Removing old Docker versions (if any)..."
sudo dnf remove -y docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

echo "Installing required packages..."
sudo dnf install -y dnf-plugins-core

echo "Setting up the Docker repository..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "Installing Docker CE..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Verifying Docker installation..."
sudo docker run hello-world

echo "Docker installation completed successfully!"
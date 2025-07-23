Here’s a step-by-step guide and a ready-to-use script to install Docker on RHEL 8/9 (also works for CentOS, Rocky, and AlmaLinux):

⸻

A. Install Docker on RHEL: Manual Steps

1. Remove Old Versions (if any):

sudo dnf remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

2. Install Required Packages:

sudo dnf install -y dnf-plugins-core

3. Set Up Docker Repository:

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

4. Install Docker Engine:

sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

5. Start and Enable Docker:

sudo systemctl start docker
sudo systemctl enable docker

6. Test Docker Installation:

sudo docker run hello-world

You should see a success message from Docker!

⸻

B. Docker Install Script

Here’s a bash script that does all the steps above:

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


⸻

How to Use the Script:
	1.	Create the script file:

nano docker-install.sh


	2.	Paste the script above and save.
	3.	Make it executable:

chmod +x docker-install.sh


	4.	Run the script:

./docker-install.sh



⸻

Extra:
	•	To run Docker as a non-root user (optional, recommended), add your user to the docker group:

sudo usermod -aG docker $USER

Then log out and log back in.

⸻

Let me know if you want to install a specific Docker version or want a script for a different Linux distro!
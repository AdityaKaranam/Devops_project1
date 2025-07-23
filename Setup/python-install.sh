#!/bin/bash

# Script to install Python 3 and pip on RHEL/CentOS/Rocky/Alma

set -e

echo "Installing Python 3..."
sudo dnf install -y python3

#echo "Installing pip for Python 3..."
#sudo dnf install -y python3-pip

echo "Checking Python version..."
python3 --version

echo "Checking pip version..."
pip3 --version

echo "Python 3 and pip installation completed successfully."


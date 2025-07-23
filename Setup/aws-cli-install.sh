#!/bin/bash

set -e

echo "Downloading AWS CLI for ARM64 (aarch64)..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

echo "Installing unzip if necessary..."
sudo dnf install -y unzip

echo "Unzipping AWS CLI package..."
unzip awscliv2.zip

echo "Running AWS CLI installer..."
sudo ./aws/install

echo "Checking AWS CLI version..."
aws --version

echo "Cleaning up..."
rm -rf awscliv2.zip aws/

echo "AWS CLI v2 (ARM64) installed successfully!"
Manual Step-by-Step Instructions

1. Download the AWS CLI v2 Installer

curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

2. Install unzip if not already installed

sudo dnf install -y unzip

3. Unzip the installer

unzip awscliv2.zip

4. Run the install script

sudo ./aws/install

[root@m2 aws]# ./install 
You can now run: /usr/local/bin/aws --version
[root@m2 aws]# 

5. Check AWS CLI version

aws --version

You should see something like:

aws-cli/2.16.7 Python/3.11.8 Linux/5.14.0-xxx exe/x86_64...

6. (Optional) Clean up

rm -rf awscliv2.zip aws/

stored in Downloads.
⸻

All-in-One Script

#!/bin/bash

set -e

echo "Downloading AWS CLI v2..."
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

echo "AWS CLI v2 installed successfully!"


⸻

Usage:
	1.	Save the script as install-aws-cli.sh
	2.	Make it executable: chmod +x install-aws-cli.sh
	3.	Run: ./install-aws-cli.sh

⸻

Let me know if you want this for ARM (aarch64) systems, need proxy settings, or want help configuring AWS CLI after install!
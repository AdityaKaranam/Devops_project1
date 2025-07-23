Perfect! Here’s a script that will:
	•	Install Python 3 (latest available via DNF)
	•	Install pip for Python 3
	•	Show the installed versions of both

⸻

python-install.sh

#!/bin/bash

# Script to install Python 3 and pip on RHEL/CentOS/Rocky/Alma

set -e

echo "Installing Python 3..."
sudo dnf install -y python3

echo "Installing pip for Python 3..."
sudo dnf install -y python3-pip

echo "Checking Python version..."
python3 --version

echo "Checking pip version..."
pip3 --version

echo "Python 3 and pip installation completed successfully."


⸻

How to Use:
	1.	Create the script file:

nano python-install.sh


	2.	Paste the script above and save the file.
	3.	Make it executable:

chmod +x python-install.sh


	4.	Run the script:

./python-install.sh



⸻

That’s it!
If you want the script to install a specific Python version, let me know which one and I’ll customize it.
If you hit any errors, just paste them here for troubleshooting!
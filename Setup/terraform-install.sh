#Installing terrform on RHEL server

echo "Add the HashiCorp Linux Repository"
#This is the official method and ensures you always get the latest (and trusted) Terraform builds.
sudo dnf install -y dnf-plugins-core

echo "Adding HashiCorp repository..."
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo


echo " Install Terraform"
sudo dnf install -y terraform

echo " Verify the Installation"
terraform -version
echo "Terraform installation completed successfully."

echo " Location of terraform installation"
whereis terraform

rpm -ql terraform
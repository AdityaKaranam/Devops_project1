subscription-manager repos --enable ansible-automation-platform-2.4-for-rhel-9-aarch64-source-rpms

echo "Installing pre-req repo epel-release"
sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

echo " install ansible" 
dnf install -y ansible


ansible --version
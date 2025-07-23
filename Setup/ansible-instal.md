Absolutely! Here’s how to install Ansible on a RHEL 8/9 server (also works for CentOS, Rocky, AlmaLinux):

⸻

A. Install Ansible via DNF (Recommended for RHEL 8/9)
	1.	Enable the EPEL repository (if not already enabled):
run subscription-manager repos --list
get the repo ID from the list. 

run the command
subscription-manager repos --enable ansible-automation-platform-2.4-for-rhel-9-aarch64-source-rpms
Repository 'ansible-automation-platform-2.4-for-rhel-9-aarch64-source-rpms' is enabled for this system.


1. Pre-requisited isntall epel-release repo

sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

2. install ansible 
dnf install -y ansible
Installed products updated.

Installed:
  ansible-1:7.7.0-1.el9.noarch              ansible-core-1:2.14.18-1.el9.aarch64     python3-cffi-1.14.5-5.el9.aarch64       python3-cryptography-36.0.1-4.el9.aarch64    
  python3-packaging-20.9-5.el9.noarch       python3-ply-3.11-14.el9.noarch           python3-pycparser-2.20-6.el9.noarch     python3-pyparsing-2.4.7-9.el9.noarch         
  python3-resolvelib-0.5.4-5.el9.noarch     sshpass-1.09-4.el9.aarch64  

  [root@m2 Desktop]# ansible --version
ansible [core 2.14.18]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.9/site-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.9.21 (main, Jun 27 2025, 00:00:00) [GCC 11.5.0 20240719 (Red Hat 11.5.0-5)] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
[root@m2 Desktop]# 
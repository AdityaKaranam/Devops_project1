akarnam@m2 Devops_project1]$ git add .
[akarnam@m2 Devops_project1]$ git commit -m "first commit"
[master (root-commit) ae00967] first commit
 12 files changed, 889 insertions(+)
 create mode 100755 Setup/Mounting_new_disk.md
 create mode 100755 Setup/Networking_VMissue.md
 create mode 100755 Setup/ansible-instal.md
 create mode 100755 Setup/ansible-install.sh
 create mode 100755 Setup/aws-cli-install.md
 create mode 100755 Setup/aws-cli-install.sh
 create mode 100755 Setup/docker-install.md
 create mode 100755 Setup/docker-install.sh
 create mode 100755 Setup/python-install.md
 create mode 100755 Setup/python-install.sh
 create mode 100755 Setup/terraform-install.md
 create mode 100755 Setup/terraform-install.sh
[akarnam@m2 Devops_project1]$ ls -ltr
total 4
drwxrwxrwx. 2 akarnam akarnam 4096 Jul 23 13:35 Setup
drwxrwxrwx. 2 akarnam akarnam    6 Jul 23 17:14 Proj1
[akarnam@m2 Devops_project1]$ git branch -M main
[akarnam@m2 Devops_project1]$ git remote add origin git@github.com:AdityaKaranam/Devops_project1.git
[akarnam@m2 Devops_project1]$ git push -u origin main
Enumerating objects: 15, done.
Counting objects: 100% (15/15), done.
Delta compression using up to 8 threads
Compressing objects: 100% (13/13), done.
Writing objects: 100% (15/15), 11.54 KiB | 3.84 MiB/s, done.
Total 15 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To github.com:AdityaKaranam/Devops_project1.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.


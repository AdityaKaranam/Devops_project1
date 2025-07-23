akarnam@m2 ~]$ ssh-keygen -t ed25519 -C "aditya.karnam1@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/akarnam/.ssh/id_ed25519): 
Created directory '/home/akarnam/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/akarnam/.ssh/id_ed25519
Your public key has been saved in /home/akarnam/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:1AljHzPWylYOHJlwIWefkCYaH4yNuGxpfgRMsc2cUKg aditya.karnam1@gmail.com
The key's randomart image is:
+--[ED25519 256]--+
|   o+=.=*o%B     |
|    =*+o=@BBo.   |
|   o.+=+.=+=o    |
|  E * o.. + .    |
|   + .  S.       |
|    . .          |
|     .           |
|                 |
|                 |
+----[SHA256]-----+
[akarnam@m2 ~]$ pwd
/home/akarnam



akarnam@m2 ~]$ cd .ssh
[akarnam@m2 .ssh]$ ls -ltr
total 8
-rw-r--r--. 1 akarnam akarnam 106 Jul 23 16:59 id_ed25519.pub
-rw-------. 1 akarnam akarnam 419 Jul 23 16:59 id_ed25519
[akarnam@m2 .ssh]$ eval "$(ssh-agent -s)"
Agent pid 3487
[akarnam@m2 .ssh]$ ssh-add ~/.ssh/id_ed25519
Identity added: /home/akarnam/.ssh/id_ed25519 (aditya.karnam1@gmail.com)
[akarnam@m2 .ssh]$ cat ~/.ssh/id_ed25519.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOIV/ik7i9KX+3lSE73LHBZ+hYugr8z6qmMPzlLeCYs6 aditya.karnam1@gmail.com
[akarnam@m2 .ssh]$ ssh -T git@github.com
The authenticity of host 'github.com (140.82.112.3)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Hi AdityaKaranam! You've successfully authenticated, but GitHub does not provide shell access.


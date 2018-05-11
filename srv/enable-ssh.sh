#!/usr/bin/env bash

PASSWORD=$(/usr/bin/openssl passwd -crypt "$2")

echo "==> Enabling SSH"
# packer-specific configuration
/usr/bin/useradd --password ${PASSWORD} --comment 'packer User' --create-home --user-group $1
echo 'Defaults env_keep += "SSH_AUTH_SOCK"' > /etc/sudoers.d/10_packer
echo "$1 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/10_packer

/usr/bin/chmod 0440 /etc/sudoers.d/10_packer
/usr/bin/systemctl start sshd.service

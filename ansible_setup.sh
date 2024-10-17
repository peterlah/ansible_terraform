#!/bin/bash

# Update package list and install required packages
sudo apt update -y
sudo apt install software-properties-common -y

# Add Ansible PPA repository and install Ansible Core (only for server)
if [ "${IS_SERVER}" = "true" ]; then
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt update -y
  sudo apt install -y ansible

  # Configure Ansible hosts file
  cat <<EOT | sudo tee -a /etc/ansible/hosts
[nginx]
node1.ansible.internal
node2.ansible.internal
node3.ansible.internal
EOT

  # Configure Ansible config
  cat <<EOT | sudo tee -a /etc/ansible/ansible.cfg
[defaults]
interpreter_python = /usr/bin/python3
host_key_checking = False
EOT

  # Copy the private key to the server
  echo "${PRIVATE_KEY}" | sudo tee /home/azureadmin/.ssh/id_rsa > /dev/null
  sudo chmod 600 /home/azureadmin/.ssh/id_rsa
  sudo chown azureadmin:azureadmin /home/azureadmin/.ssh/id_rsa
fi

# Copy the public key to authorized_keys
echo "${PUBLIC_KEY}" | tee -a /home/azureadmin/.ssh/authorized_keys

# Set correct permissions for authorized_keys
chmod 600 /home/azureadmin/.ssh/authorized_keys
chown azureadmin:azureadmin /home/azureadmin/.ssh/authorized_keys

# Set up SSH config for passwordless access to nodes (only for server)
if [ "${IS_SERVER}" = "true" ]; then
  cat <<EOT | tee -a /home/azureadmin/.ssh/config
Host *.ansible.internal
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    User azureadmin
    IdentityFile ~/.ssh/id_rsa
EOT

  # Set correct permissions for SSH config
  chmod 600 /home/azureadmin/.ssh/config
  chown azureadmin:azureadmin /home/azureadmin/.ssh/config
fi
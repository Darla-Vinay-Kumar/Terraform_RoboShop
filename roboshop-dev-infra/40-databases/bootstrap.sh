#!/bin/bash
component=$1
dnf install ansible -y
#ansible-pull -U https://github.com/Darla-Vinay-Kumar/Ansible_Roboshop_Roles-tf.git -e component=$component main.yml -i inventory.ini
REPO_URL="https://github.com/Darla-Vinay-Kumar/Ansible_Roboshop_Roles-tf.git"
REPO_DIR="/tmp/ROBOSHOP/ANSIBLE"
ANSIBLE_DIR="Ansible_Roboshop_Roles-tf"

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
touch ansible.log
cd $REPO_DIR

#check if ansible repo already cloned or not
#check if directory already exists
if [ -d "$ANSIBLE_DIR" ]; then
    echo "Directory $ANSIBLE_DIR already exists. Pulling latest changes."
    cd $ANSIBLE_DIR
    git pull origin main
else
    echo "Cloning repository $REPO_URL into $REPO_DIR"
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible -playbook -e component=$component main.yml -i inventory.ini &>> /var/log/roboshop/ansible.log
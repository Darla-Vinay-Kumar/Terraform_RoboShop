#!/bin/bash
component=$1
dnf install ansible -y
ansible-pull -U https://github.com/Darla-Vinay-Kumar/Ansible_Roboshop_Roles-tf.git -e component=$component main.yml -i inventory.ini
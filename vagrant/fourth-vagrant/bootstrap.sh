#! /usr/bin/env bash

# Install Ansible
yum install epel-release -y
yum install ansible -y

# Configure first environment for vagrant only
mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
touch /home/vagrant/.vimrc
touch /home/vagrant/.bashrc

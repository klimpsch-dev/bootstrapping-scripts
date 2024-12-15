#!/bin/bash

set -e

sudo yum update -y
sudo yum install -y wget curl git neovim net-tools epel-release

sudo yum groupinstall -y

sudo yum install -y \
    htop \
    unzip \
    tar \
    python3 \
    gcc \
    bash-completion\
    firewalld

sudo systemctl start firewalld
sudo systemctl enable firewalld

sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload

sudo yum install -y epel-release


echo "Enabling bash completion..."
echo "if [ -f /etc/bash_completion ]; then" >> ~/.bashrc
echo "  . /etc/bash_completion" >> ~/.bashrc
echo "fi" >> ~/.bashrc
source ~/.bashrc

sudo yum autoremove -y
sudo yum clean all
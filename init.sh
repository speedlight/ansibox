#!/usr/bin/env bash 
HOMEDIR=$HOME 
USERNAME=$(whoami) 
USE_SUDO='' 
if [ $USERNAME != "root" ]; then
    USE_SUDO="sudo "
fi

# Do we need to install Ansible?  
command -v ansible > /dev/null 2>&1   
if [ $? -ne 0 ]; then
    echo "We need Ansible!..."
    # Ansible Debian installation, do I use another distro?
    # from: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian
    $USE_SUDO echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible-debian.list
    $USE_SUDO apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    $USE_SUDO apt-get update
    $USE_SUDO apt-get install ansible
fi

# Run complete speedbox setup
#ansible-playbook playbooks/postinstall.yml

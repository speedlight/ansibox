#!/usr/bin/env bash 
HOMEDIR=$HOME 
USERNAME=$(whoami) 
USE_SUDO='' 
if [ $USERNAME != "root" ]; then
    USE_SUDO="sudo "
fi
 
PYENVPATH=`cat <<EOF
    if [ -d $HOMEDIR/.pyenv/bin ]; then
        export PATH="/home/ceguez/.pyenv/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
EOF
`

# Do we have python and pyenv?
command -v python3 > /dev/null 2>&1   
if [ $? -ne 0 ]; then
    echo "Oh no this is bad, we need python3 to run ansible! Please install it for me :("
else 
    echo "So we have python3, let's see if we have pyenv.."
    command -v pyenv > /dev/null 2>&1   
        if [ $? -ne 0 ]; then
            echo "Looks like we need pyenv, lets install it for you.."
            curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
            echo "Now we need to update our .bashrc.."
            echo $PYENVPATH >> $HOMEDIR/.bashrc
            source $HOMEDIR/.bashrc
        fi
fi
            
# Do we need to install Ansible?  
#command -v ansible > /dev/null 2>&1   
#if [ $? -ne 0 ]; then
#    echo "We need Ansible!..."
#    # Ansible Debian installation, do I use another distro?
#    # from: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian
#    $USE_SUDO echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible-debian.list
#    $USE_SUDO apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
#    $USE_SUDO apt-get update
#    $USE_SUDO apt-get install ansible
#fi

# Run complete speedbox setup
#ansible-playbook playbooks/postinstall.yml

#!/usr/bin/env bash 
HOMEDIR=$HOME 
USERNAME=$(whoami) 
USE_SUDO='' 
if [ $USERNAME != "root" ]; then
    USE_SUDO="sudo "
fi

# Do we need to install SaltStack?  
command -v salt-call > /dev/null 2>&1   
if [ $? -ne 0 ]; then
    echo "We need SaltStack ..."
    # Linux (Hopefully ...): SaltStack Bootstrap one-liner
    # -d Don't enable salt-minion autostart
    # -P Allow pip based installations
    curl -L https://bootstrap.saltstack.com -o install_salt.sh | $USE_SUDO sh install_salt.sh -P -d
fi

# Set the user, home-directory, and state root 
$USE_SUDO salt-call --local --config=./ --state-output=changes grains.setvals "{ \"user\": \"$USERNAME\", \"homedir\": \"$HOMEDIR\" }"

# Apply the high state 
if [[ ! $1 ]]; then
    $USE_SUDO salt-call --local --config=./ --state_verbose=False --state-output=mixed --log-level=quiet --retcode-passthrough state.highstate
else
    $USE_SUDO salt-call --local --config=./ --state_verbose=False --state-output=mixed --log-level=quiet --retcode-passthrough state.sls $1
fi

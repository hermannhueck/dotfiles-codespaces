#!/bin/bash
#

echo "Setting up the codespace environment at $(date)" | tee $HOME/setup.log

set -x

pwd | tee $HOME/setup.log
ls -al | tee $HOME/setup.log

echo $HOME | tee $HOME/setup.log
echo ~ | tee $HOME/setup.log
sleep 10 | tee $HOME/setup.log

# chmod +x bin/*
# bin/packages-outdated
# sudo apt install --yes tree wget
# bin/scala-tools-setup

set +x

echo "Terminated codespace environment setup at $(date)" | tee $HOME/setup.log

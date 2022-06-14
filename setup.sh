#!/bin/bash
#

echo "Setting up the codespace environment at $(date)" | tee -a $HOME/setup.log

set -x

pwd | tee -a $HOME/setup.log
ls -al | tee -a $HOME/setup.log

cp -r .??* bin ~
cd

pwd | tee -a $HOME/setup.log
ls -al | tee -a $HOME/setup.log

chmod +x bin/*

bin/packages-outdated && bin/packages-upgrade
sudo apt install --yes tree wget 
bin/scala-tools-setup 

set +x

echo "Terminated codespace environment setup at $(date)" | tee -a $HOME/setup.log

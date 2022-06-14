#!/bin/bash
#

logfile="$HOME/setup_$(date).log"

echo "$(date):  Setting up the codespace environment ..." >> $logfile

echo "$(date):  Copying from dotfiles directory to $HOME ..." >> $logfile
cp -r .??* bin ~
cat my-profile >> ~/.profile
cat my-profile >> ~/.bashrc
chmod +x ~/bin/*
echo "$(date):  Copying DONE." >> $logfile

cd

# run scripts
echo "$(date):  Updating Ubuntu packages ..." >> $logfile
bin/packages-outdated && bin/packages-upgrade
echo "$(date):  Updating Ubuntu DONE." >> $logfile

echo "$(date):  Installing additional packages ..." >> $logfile
sudo apt install --yes tree wget 
echo "$(date):  Installing DONE." >> $logfile

echo "$(date):  Setting up Scala Tools ..." >> $logfile
bin/scala-tools-setup 
echo "$(date):  Scala Tools Setup DONE." >> $logfile

echo "$(date):  Codespace Environment Setup DONE." >> $logfile

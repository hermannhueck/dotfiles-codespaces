#!/bin/bash
#

logfile="$HOME/setup_$(date "+%Y-%m-%d_%H:%M:%S").log"

echo "=== $(date "+%Y-%m-%d %H:%M:%S"):  Setting up the codespace environment ..." >> $logfile

echo ">>> $(date "+%Y-%m-%d %H:%M:%S"):  Copying from dotfiles directory to $HOME ..." >> $logfile
cp -r .??* bin ~
cat my-profile >> ~/.profile
cat my-profile >> ~/.bashrc
chmod +x ~/bin/*
echo "<<< $(date "+%Y-%m-%d %H:%M:%S"):  Copying DONE." >> $logfile

cd

# run scripts
echo ">>> $(date "+%Y-%m-%d %H:%M:%S"):  Setting up Scala Tools ..." >> $logfile
bin/scala-tools-setup 
echo "<<< $(date "+%Y-%m-%d %H:%M:%S"):  Scala Tools Setup DONE." >> $logfile

echo ">>> $(date "+%Y-%m-%d %H:%M:%S"):  Updating Ubuntu packages ..." >> $logfile
bin/packages-outdated && bin/packages-upgrade
echo "<<< $(date "+%Y-%m-%d %H:%M:%S"):  Updating Ubuntu DONE." >> $logfile

echo ">>> $(date "+%Y-%m-%d %H:%M:%S"):  Installing additional packages ..." >> $logfile
sudo apt install --yes tree direnv fzf bat
echo "<<< $(date "+%Y-%m-%d %H:%M:%S"):  Installing DONE." >> $logfile

echo "=== $(date "+%Y-%m-%d %H:%M:%S"):  Codespace Environment Setup DONE." >> $logfile

#!/bin/bash

# copy from dotfiles directory to $HOME
cp -r .??* bin ~
cat my-profile >> ~/.profile
cat my-profile >> ~/.bashrc
chmod +x ~/bin/*

cd

# run scripts
bin/packages-outdated && bin/packages-upgrade
sudo apt install --yes tree wget 
bin/scala-tools-setup 

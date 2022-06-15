#!/bin/bash
#

logfile="$HOME/setup_$(date "+%Y-%m-%d_%H:%M:%S").log"

function log {
  prefix="$1"
  message="$2"
  echo "$prefix $(date "+%Y-%m-%d %H:%M:%S"):  $message" ||
  echo "$prefix $(date "+%Y-%m-%d %H:%M:%S"):  $message"
}

function done_or_failed {
  status=$1
  message="$2"
  [ $status -eq 0 ] &&
  log "<<<" "$message DONE." ||
  log "<<<" "$message FAILED."
}

log "===" "Setting up the codespace environment ..." >> $logfile

log ">>>" "Copying from dotfiles directory to $HOME ..." >> $logfile
cp -r .??* bin ~
cat my-profile >> ~/.profile
cat my-profile >> ~/.bashrc
chmod +x ~/bin/*
log "<<<" "Copying DONE." >> $logfile

cd

# run scripts
log ">>>" "Setting up Scala Tools ..." >> $logfile
bin/scala-tools-setup
done_or_failed $? "Scala Tools Setup" >> $logfile

log ">>>" "Installing additional tools ..." >> $logfile
sudo apt-get update &&
  sudo apt install --yes tree direnv fzf bat &&
  cd /usr/bin && sudo ln -s batcat bat && cd -
done_or_failed $? "Installation of tools" >> $logfile

log ">>>" "Updating Ubuntu packages ..." >> $logfile
sudo apt-get upgrade --yes &&
  sudo apt-get autoclean --yes &&
  sudo apt-get autoremove --yes
done_or_failed $? "Updating Ubuntu" >> $logfile

log "===" "Codespace Environment Setup TERMINATED." >> $logfile

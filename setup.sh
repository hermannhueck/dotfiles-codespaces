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

exec >> $logfile 2>&1

echo "============================================================"
log "===" "Setting up the codespace environment ..."

echo
echo "------------------------------------------------------------"
log ">>>" "Copying from dotfiles directory to $HOME ..."
cp -r .??* bin ~ &&
cat my-profile >> ~/.profile &&
cat my-profile >> ~/.bashrc &&
chmod +x ~/bin/*
done_or_failed $? "Copying DONE."
echo "------------------------------------------------------------"

cd

# run scripts
echo
echo "------------------------------------------------------------"
log ">>>" "Setting up Scala Tools ..."
bin/scala-tools-setup
done_or_failed $? "Scala Tools Setup"
echo "------------------------------------------------------------"

echo
echo "------------------------------------------------------------"
log ">>>" "Installing additional tools ..."
sudo apt-get update &&
  sudo apt install --yes tree direnv fzf bat &&
  cd /usr/bin && sudo ln -s batcat bat && cd -
done_or_failed $? "Installation of tools"
echo "------------------------------------------------------------"

echo
echo "------------------------------------------------------------"
log ">>>" "Updating Ubuntu packages ..."
sudo apt-get upgrade --yes &&
  sudo apt-get autoclean --yes &&
  sudo apt-get autoremove --yes
done_or_failed $? "Updating Ubuntu"
echo "------------------------------------------------------------"

echo
log "===" "Codespace Environment Setup TERMINATED."
echo "============================================================"

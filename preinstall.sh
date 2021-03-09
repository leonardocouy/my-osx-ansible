#!/bin/sh

set -e
set -u

awesome_echo() {
  BOLD=$(tput bold)
  BLUE=$(tput setaf 4)
  NORMAL=$(tput sgr0)

  printf "${BLUE}==>${NORMAL} ${BOLD} $1 $2 ${NORMAL}\n"
}

has() {
    type "$1" > /dev/null 2>&1
}

### STARTING

awesome_echo "PARTY STARTED.." "🍾"

## Homebrew install & update

if ! has brew; then
    awesome_echo "Installing brew.." "🍾"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

# Ensure Apple's command line tools are installed
if ! has cc; then
  awesome_echo "Installing xcode..." "🐼"
  xcode-select --install
fi

# Ensure pip has been installed
if ! has pip; then
  awesome_echo "Installing pip..." "🙈"
  sudo python -m ensurepip
fi

sudo pip install --upgrade pip

# Ensure pip has been installed

if ! has ansible; then
  awesome_echo "Installing ansible..." "🎃"
  sudo pip install ansible
fi

#### FINISH

awesome_echo "PARTY FINISHED.." "😩"

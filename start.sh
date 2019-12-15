#!/usr/bin/env bash

### READ:
### regarding shell scripting for posix :
### https://unix.stackexchange.com/a/33762/314538
### https://unix.stackexchange.com/questions/392450/bash-renaming-files-extension

# stdout messages
sep='--------------------------------------------------------'
osupdate_msg='Installing recommended OS update, this requires administrator password. \
Run this again if restarting.'
timezone_msg='Setting system timezone to'
xcode_msg='Installing Xcode...'
gitclone_msg='Cloning .dev repo...'
chmod_msg='Changing permissions for .sh files to +x...'
osx_cfg_msg='Setting up macOS default settings...'
dotfiles_msg='Creating dotfiles in home folder...'
brewinstall_msg='Installing brew...'
cli_tools_msg='Installing cli tools...'

header () {
	echo "
$sep
: $1 $2
"
}

# Start
echo "$sep"
echo "$(date), macOS version: $(sw_vers -productVersion)"

header "$osupdate_msg"

## Ask for the administrator password upfront
sudo -v

## Keep-alive: update existing `sudo` time stamp until we're finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Install macOS recommended update(s)
sudo softwareupdate --install --recommended --restart --verbose

## and install Xcode tools
header "$xcode_msg"
xcode-select --install

# TODO: evaluate the best sequence/strategy since brew install affects dotfiles
# which means it affects dotfiles.sh
# maybe create a function in dotfiles.sh to detect if each file existed already
# if so either merge the diff'd lines or copy as new file with .default extension

## cli tools
## header "$cli_tools_msg"
##

## install from brew
## TODO: get list from ./install_cfg/brew_packages.cfg (pure bash/python/ansible) using -f filename flag
./brew_install_packages.sh

## clone .dev repo
header "$gitclone_msg"
git clone https://github.com/oleng/.dev.git && cd .dev

header "$chmod_msg"
chmod -R +x *.sh

## dotfiles
header "$dotfiles_msg"
./dotfiles.sh

## install brew package manager
header "$brewinstall_msg"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

## start setting os
header "$osx_cfg_msg"
./osx.sh


## Done
header "Setup finished. Exiting."
exit 0


# Enable find my mac with defaults (Warning ABSOLUTE PATH ONLY):
#	defaults [-currentHost | -host hostname] write domain { 'plist' | key 'value' }

# breaks the defaults read
# defaults write /System/Library/LaunchDaemons/com.apple.findmymac.plist MachServices '{"com.apple.findmymacd" =0;}'


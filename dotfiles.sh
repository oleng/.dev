#!/usr/bin/env bash

## dotfiles

bash_msg='creating .aliases & .bash_profile...'
git_cfg_msg='creating .gitignore & .gitconfig...'
ssh_msg='creating ssh config...'

bashdots=''

header () {
	echo "-> $1 "
}

header "$bash_msg"
printf '
cp -v dotfiles/aliases ~/.aliases
cp -v dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile
'
header "$git_cfg_msg"
printf '
cp -v dotfiles/gitignore ~/.gitignore
cp -v dotfiles/gitconfig ~/.gitconfig
'

header "$ssh_msg"
printf 'cp .ssh ~/.ssh'

exit 0
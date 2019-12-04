#!/usr/bin/env bash

## dotfiles

bash_msg='creating .bash_profile, .bashrc & .aliases...'
git_cfg_msg='creating .gitignore & .gitconfig...'
ssh_msg='copying ssh config...'

dotfiles=''

header () {
	echo "-> $1 "
}

header "$bash_msg"
cp -v dotfiles/bash_profile ~/.bash_profile
cp -v dotfiles/bashrc ~/.bashrc
cp -v dotfiles/aliases ~/.aliases
# TODO: transfer secret keys from vault
touch ~/.secrets
source ~/.bash_profile


header "$git_cfg_msg"
cp -v dotfiles/gitignore ~/.gitignore
cp -v dotfiles/gitconfig ~/.gitconfig


header "$ssh_msg"
cp .ssh ~/.ssh'

exit 0
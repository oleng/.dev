#!/usr/bin/env bash

## dotfiles

bash_msg='copying .bash_profile, .bashrc & .aliases...'
git_cfg_msg='creating folder .git_templates, .gitignore & .gitconfig...'
ssh_msg='copying ssh config...'

header () {
	echo "-> $1 "
}

## start exec

header "$bash_msg"
cp -v dotfiles/.bash* ~/
# TODO: transfer secret keys from vault
touch ~/.secrets

header "$git_cfg_msg"
cp -vRf dotfiles/.git* ~/

header "$ssh_msg"
cp .ssh ~/


header 'Sourcing .bash_profile to finish setup.'
source ~/.bash_profile

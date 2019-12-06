#!/usr/bin/env bash

## dotfiles

bash_msg='ing .bash_profile, .bashrc & .aliases...'
git_cfg_msg='creating folder .git_templates, .gitignore & .gitconfig...'
ssh_msg='copying ssh config...'

dotfiles=''

header () {
	echo "-> $1 "
}

header "$bash_msg"
cp -v dotfiles/.bash* ~/
cp -v dotfiles/.aliases ~/
# TODO: transfer secret keys from vault
touch ~/.secrets

source ~/.bash_profile


header "$git_cfg_msg"
cp -vRf dotfiles/.git* ~/

header "$ssh_msg"
cp .ssh ~/.ssh'

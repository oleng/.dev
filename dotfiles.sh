#!/usr/bin/env bash

## dotfiles

bash_msg='symlinking .bash_profile and .bashrc to home folder...'
git_cfg_msg='creating folder .git_templates, .gitignore & .gitconfig...'
ssh_msg='copying ssh config...'

printheader() {
	echo " ➜  $1 "
}

## start exec

printheader "$bash_msg"

# create symlink from dotfiles/.bash*
ln -s $(pwd)/dotfiles/.bash_profile ~/.bash_profile
ln -s $(pwd)/dotfiles/.bashrc ~/.bashrc

# TODO: transfer secret keys from vault
# touch ~/.secrets

printheader "$git_cfg_msg"
cp -vRf $(pwd)/dotfiles/.git* ~/

printheader "$ssh_msg"
cp .ssh ~/


printheader 'Sourcing .bash_profile to finish setup.'
source ~/.bash_profile

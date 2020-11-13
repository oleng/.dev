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
# cp -vRf $(pwd)/dotfiles/.git* ~/
# symlink instead
ln -s $(pwd)/dotfiles/.git_templates ~/.git_templates
ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig
ln -s $(pwd)/dotfiles/.gitignore ~/.gitignore

printheader "$ssh_msg"
cp .ssh ~/


printheader 'Sourcing .bash_profile to finish setup.'
source ~/.bash_profile

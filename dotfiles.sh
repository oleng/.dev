#!/usr/bin/env bash

## dotfiles

bash_msg="symlinking .bash_profile and .bashrc to ${HOME}..."
git_cfg_msg="creating folder .git_templates, .gitignore & .gitconfig..."
ssh_msg="symlinking ssh config to ${HOME}..."

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
# create symlink 
ln -s $(pwd)/dotfiles/.git_templates ~/.git_templates
ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig

printheader "$ssh_msg"
ln -s $(pwd)/dotfiles/.ssh ~/.ssh


printheader 'Sourcing .bash_profile to finish setup.'
source ~/.bash_profile

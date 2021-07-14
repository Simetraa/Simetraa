#!/usr/bin/env bash

echo Installing symlinks to dotfiles...

ln -svf $(pwd)/.bash_aliases ~/.bash_aliases
ln -svf $(pwd)/.gitconfig ~/.gitconfig
ln -svf $(pwd)/.profile ~/.profile

echo Installing pubkeys...

gpg --keyserver keyserver.ubuntu.com --recv FEF981DF2ABB975C
GITHUB_USERNAME="Simetraa"
ssh-import-id-gh $GITHUB_USERNAME

echo Installing packages...

sudo apt install ssh git w3m w3m-img tree snap screen dirmngr htop --yes
sudo snap install gh exa
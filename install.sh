#!/usr/bin/env bash

./uninstall.sh

echo Installing symlinks to dotfiles...

ln -sv "$(pwd)/.bash_aliases ~/.bash_aliases"
ln -sv "$(pwd)/.gitconfig ~/.gitconfig"
ln -sv "$(pwd)/.profile ~/.profile"


echo Installing pubkeys...

gpg --keyserver keyserver.ubuntu.com --recv FEF981DF2ABB975C
GITHUB_USERNAME="Simetraa"
ssh-import-id-gh $GITHUB_USERNAME

echo Installing packages...

sudo apt install w3m w3m-img tree exa gh screen dirmngr htop --yes
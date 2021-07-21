#!/usr/bin/env bash

echo Installing symlinks to dotfiles...

ln -svf $(pwd)/.bash_aliases ~/.bash_aliases
ln -svf $(pwd)/.gitconfig ~/.gitconfig
ln -svf $(pwd)/.profile ~/.profile
ln -svf $(pwd)/.bashrc ~/.bashrc


echo Installing packages...

sudo apt install nano ssh-import-id ssh git w3m w3m-img tree snap screen dirmngr htop udisks2 eject bash python3-pip ffmpeg cifs-utils --yes
pip install howdoi spotdl

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo Installing pubkeys...

gpg --keyserver keyserver.ubuntu.com --recv FEF981DF2ABB975C
GITHUB_USERNAME="Simetraa"
ssh-import-id-gh $GITHUB_USERNAME

while true; do
read -p "Is this a desktop installation? [Y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
        wget -O /tmp/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
        sudo apt install /tmp/chrome.deb
        wget -O /tmp/code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
        sudo apt install /tmp/code.deb
        wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
        sudo apt install /tmp/discord.deb
        sudo snap install authy
        sudo apt install seahorse
        break
elif [[ $REPLY =~ [Nn]$  ]]
then
        break
else
    echo Invalid response
fi
done
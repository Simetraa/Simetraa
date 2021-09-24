#!/usr/bin/env bash

echo Installing fish shell

sudo apt install software-properties-common
sudo apt-add-repository ppa:fish-shell/release-3 --yes
sudo apt update
sudo apt --yes install fish 

echo Type your password to set the default shell.

# Set default shell to fish
chsh -s /usr/bin/fish
mkdir ~/.config

# See https://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -svf $SCRIPT_DIR/fish ~/.config
ln -svf $SCRIPT_DIR/.gitconfig ~/.gitconfig

echo Installing packages...

sudo apt --yes install python-is-python3 nano ssh-import-id ssh git tree snap screen dirmngr htop udisks2 eject bash python3-pip ffmpeg cifs-utils --yes

echo Installing python packages...

sudo apt --yes install python3-testresources python3-pip
pip install spotdl howdoi
# Downgrade requests - we need a certain version.
pip3 install requests>=2.25.0 -U

echo Installing pubkeys...

gpg --keyserver keyserver.ubuntu.com --recv FEF981DF2ABB975C
set GITHUB_USERNAME "Simetraa"

if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
then
        echo TODO: Implement windows install scripts.
else
        ./install_linux.sh
fi



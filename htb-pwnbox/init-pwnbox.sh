#!/bin/bash
PREV_PWD=$(pwd)
WDIR="$HOME/my_data"

cd $WDIR

# get preconfigured user_init file
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/htb-pwnbox/user_init --backups=1
chmod +x user_init

# prepare home directory to preload in user_init
mkdir -p home
cd home

wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.bashrc
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.inputrc
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.tmux.conf
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/htb-pwnbox/.vimrc

# create RSA keypair for persistence over SSH
mkdir -p .ssh
ssh-keygen -t rsa -f .ssh/id_rsa

./user_init

# return to the previous working directory
cd $PREV_PWD

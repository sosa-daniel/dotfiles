#!/bin/bash
PREV_PWD=$(pwd)
DDIR="$HOME/Downloads"
FDIR="$HOME/.fonts"

# TMUX: install Plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "Downloading TMUX Plugin Manager (TPM)"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
else
	echo "tpm already installed"
fi

# VIM: Install vim-plug Plugin manager
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
	echo "Downloading VIM Plugin Manager (vim-plug)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	echo "vim-plug already installed"
fi

if [ ! -d "$DDIR" ]; then
	echo Creating Downloads directory in $HOME
	mkdir $DDIR
fi

# Fonts: Download and Install fonts
if [ ! -d "$FDIR" ]; then
	echo Creating .fonts directory in $HOME
	mkdir $FDIR
fi

if [ ! -f "$FDIR/CaskaydiaCoveNerdFontMono-Regular.ttf" ]; then
	echo Downloading CaskaydiaCove Nerd Font
	cd $DDIR
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
	unzip CascadiaCode.zip
	mv *.ttf $FDIR
	fc-cache -fv
else
	echo "CascadiaCode font already installed"
fi

# return to the previous working directory
cd $PREV_PWD
exit

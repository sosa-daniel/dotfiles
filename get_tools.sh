#!/bin/bash
REQUIRED_TOOLS="git curl wget unzip fc-cache stow tmux vim"
PREV_PWD=$(pwd)
DOWNLOADS="$HOME/Downloads"
FONT_DIR="$HOME/.fonts"
DOTFILES_DIR="$HOME/dotfiles"

# Check if tools are installed
for tool in $REQUIRED_TOOLS
do
	if ! command -v $tool >/dev/null 2>&1
	then
		echo "I require $tool but it's not installed. Aborting."
		exit 1
	fi
done

# TMUX: install Plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "Downloading TMUX Plugin Manager (TPM)"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "tpm is already installed."
fi

# VIM: Install vim-plug Plugin manager
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
	echo "Downloading VIM Plugin Manager (vim-plug)"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	echo "vim-plug is already installed."
fi

if [ ! -d "$DOWNLOADS" ]; then
	echo "Creating Downloads directory in $HOME"
	mkdir $DOWNLOADS
fi

# Fonts: Download and Install fonts
if [ ! -d "$FONT_DIR" ]; then
	echo "Creating .fonts directory in $HOME"
	mkdir $FONT_DIR
fi

if [ ! -f "$FONT_DIR/CaskaydiaCoveNerdFontMono-Regular.ttf" ]; then
	echo "Downloading CaskaydiaCove Nerd Font"
	cd $DOWNLOADS
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
	unzip CascadiaCode.zip
	mv *.ttf $FONT_DIR
	fc-cache -fv
else
	echo "CaskaydiaCove font is already installed."
fi

# return to the previous working directory
cd $PREV_PWD

echo -e "\nTools installed and files in place. Load configs using GNU stow:"
echo "\`cd $DOTFILES_DIR\`"
echo "\`stow .\`"
echo -e "\nInstall vim plugins:"
echo "\`vim +PlugInstall\`"
echo -e "\nInstall tmux plugins:"
echo "\`$DOTFILES_DIR/.tmux/plugins/tpm/bin/install_plugins\`"
exit

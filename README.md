# Purpose
Various configuration files to keep environments as homogeneous as possible across all devices.

## Load configs using GNU stow
```
stow .
```

## Install TMUX plugin manager and vim-plug
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

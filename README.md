# Purpose
Various configuration files to keep environments as homogeneous as possible across all devices.

## Load shell configs
```
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.tmux.conf
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.bashrc
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.inputrc
wget https://raw.githubusercontent.com/sosa-daniel/dotfiles/master/.vimrc

bind -f  ~/.inputrc
source ~/.bashrc
```

## Install TMUX plugin manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
```

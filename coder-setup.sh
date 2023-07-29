#!/bin/sh

# Install install ide
yay codium;

# Install neovim
yay neovim;
bash nvim-configs/requirements.sh;
mkdir ~/.config/nvim;
cp nvim-configs/* ~/.config/nvim;

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;

# Install rootless docker
curl -fsSL https://get.docker.com/rootless | sh;
sudo pacman -S docker-compose;

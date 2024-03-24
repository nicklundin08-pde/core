
#! /bin/sh

# https://dev.to/asyncedd/building-neovim-from-source-1794

apt-get update && apt-get install -y curl zip unzip git ripgrep

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
rm -rf lazygit.tar.gz lazygit

rm -rf /root/.config/nvim && git clone https://github.com/nicklundin08-pde/dotfiles-lvim.git /root/.config/nvim

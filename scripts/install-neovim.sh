#!/bin/bash

mkdir -p ~/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage ~/bin/nvim

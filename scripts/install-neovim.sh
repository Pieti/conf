#!/bin/bash

IMAGE_NAME="nvim-linux-x86_64.appimage"
mkdir -p ~/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/"${IMAGE_NAME}"
chmod +x "${IMAGE_NAME}"
mv "${IMAGE_NAME}" ~/bin/nvim

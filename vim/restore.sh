#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

packer_folder="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ ! -d "$packer_folder" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_folder"
fi

rsync -r "$script_dir/config/nvim" ~/.config/

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'


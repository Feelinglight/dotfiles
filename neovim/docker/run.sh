#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

nvim_config_folder="$script_dir/../config/nvim"
# Чтобы не переустанавливать все плагины на перезапусках докера
# Добавлена в .gitignore
nvim_data_folder="$script_dir/data/nvim"
mkdir -p "$nvim_data_folder"

docker run \
  -it \
  --rm \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  -v $(realpath "$nvim_config_folder"):/root/.config/nvim \
  -v $(realpath "$nvim_data_folder"):/root/.local/share/nvim \
  --security-opt apparmor:unconfined \
  nvim



#!/bin/bash

nvim_config_folder="nvim_config"

mkdir "$nvim_config_folder"

docker run \
  -it \
  --rm \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  -v $(realpath "$nvim_config_folder"):/root/.config/nvim \
  --security-opt apparmor:unconfined \
  nvim



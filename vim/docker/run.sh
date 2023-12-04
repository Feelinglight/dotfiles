#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

nvim_config_folder="$script_dir/../config/nvim"

docker run \
  -it \
  --rm \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  -v $(realpath "$nvim_config_folder"):/root/.config/nvim \
  --security-opt apparmor:unconfined \
  nvim



#!/bin/bash
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "$script_dir/config"

rsync -r ~/.config/nvim --delete "$script_dir/config"


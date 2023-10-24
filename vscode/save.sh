#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp ~/.config/Code/User/settings.json "$script_dir/settings.json"
cp ~/.config/Code/User/keybindings.json "$script_dir/keybindings.json"

echo "$(code --list-extensions)" > "$script_dir/extensions.txt"


#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp "$script_dir/settings.json" ~/.config/Code/User/settings.json 
cp "$script_dir/keybindings.json" ~/.config/Code/User/keybindings.json 

for ext in $(cat $script_dir/extensions.txt); do
  echo "Install $ext ..."
  code --install-extension "$ext"
done


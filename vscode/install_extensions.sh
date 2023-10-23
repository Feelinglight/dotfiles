#!/bin/bash
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for ext in $(cat $script_dir/extensions.txt); do
  echo "Install $ext ..."
  code --install-extension "$ext"
done


#!/bin/bash
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp ~/.config/Code/User/settings.json "$script_dir/settings.json"


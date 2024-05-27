#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

rsync -r ~/.ideavimrc --delete "$script_dir/.ideavimrc"


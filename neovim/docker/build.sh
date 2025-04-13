#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp /usr/share/doc/fzf/examples/key-bindings.zsh .

docker build . -t nvim


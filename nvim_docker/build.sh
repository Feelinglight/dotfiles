#!/bin/bash

set -e

cp /usr/share/doc/fzf/examples/key-bindings.zsh .

docker build . -t nvim


#!/usr/bin/env bash

repo="https://github.com/rockon999/dynamic-panel-transparency.git"

version=`gnome-shell --version | cut -d' ' -f 3 | cut -d'.' -f 1,2`

if [ "$version" \< "3.20" ] || [ "$version" = "3.20" ]; then
  clone_option="-b legacy"
fi

set -x
cd /tmp
git clone $clone_option $repo
cp -rf dynamic-panel-transparency/dynamic-panel-transparency@rockon999.github.io ~/.local/share/gnome-shell/extensions/

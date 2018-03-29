#!/usr/bin/env bash

repo_addr="https://github.com/rockon999/dynamic-panel-transparency.git"
repo_name="dynamic-panel-transparency"
version=`gnome-shell --version | cut -d' ' -f 3 | cut -d'.' -f 1,2`

if [ "$version" \< "3.20" ] || [ "$version" = "3.20" ]; then
  clone_option="-b legacy"
fi

cd /tmp
if [[ ! -d $repo_name ]]; then
  echo "Downloading extension..."
  git clone $clone_option $repo_addr
  if [ $? = 1 ]; then
    exit 1
  fi
else
  echo "Extension already downloaded, skipped."
fi

# Install extension
cp -rf $repo_name/dynamic-panel-transparency@rockon999.github.io ~/.local/share/gnome-shell/extensions/

# Enable extension
echo "Enabling extensions..."
gnome-shell-extension-tool -e dynamic-panel-transparency

echo "Restarting gnome-shell to flush the configurations..."
gnome-shell -r > /dev/null 2>&1 &

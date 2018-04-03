#!/usr/bin/env bash

# Beautify your bash prompt, make it looks like powerline.

sudo dnf install powerline powerline-fonts -y

echo '
# added for powering prompt
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi' >> ~/.bashrc

echo -n "Installation completed, restarting your bash..."
sleep 1
echo "done"
exec bash

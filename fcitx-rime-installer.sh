#!/usr/bin/env bash

# See also: https://hk.saowen.com/a/aa2aac9d77a720023f899b362514ddac0238af726e515ba287264aa4e2b269a2

# Install fcitx
sudo dnf install fcitx fcitx-configtool fcitx-gtk2 fcitx-gtk3 -y

# Install fcitx-rime
cd /tmp
curl -OL https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/resources/packages/fcitx-rime-0.3.1-2.git9351313.fc27.x86_64.rpm
sudo dnf install ./fcitx-rime-0.3.1-2.git9351313.fc27.x86_64.rpm

# Add fcitx to startup
ln -sf /usr/share/applications/fcitx.desktop ~/.config/autostart/

# Download and deploy configurations
curl -OL https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/resources/config/fcitx/fcitx.sh
curl -OL https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/resources/config/fcitx/kill-fcitx
curl -OL https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/resources/config/fcitx/kill-fcitx.service

sudo cp -f fcitx.sh /etc/profile.d/fcitx.sh
sudo cp -f kill-fcitx /usr/bin/kill-fcitx
sudo cp -f kill-fcitx.service /lib/systemd/system/kill-fcitx.service

sudo chmod +x /etc/profile.d/fcitx.sh
sudo chmod +x /usr/bin/kill-fcitx

systemctl enable kill-fcitx.service

echo 'Please reboot your system to take effect.'
echo 'Changing desktop to xorg from wayland can get better compatibility.'
echo 'You can do this by uncommenting "#WaylandEnabled=false" in /etc/gdm/custom.conf.'


#!/usr/bin/env bash

install_packages()
{
	sudo dnf install -y $*
}	

remove_packages()
{
	sudo dnf remove -y $*
}	

if [[ -e "package-utils.sh" ]]; then
	. package-utils.sh
fi

# Setup gnome shell extensions
install_packages \
	gnome-shell-extension-user-theme \
	gnome-shell-extension-dash-to-dock \
	gnome-shell-extension-topicons-plus

remove_packages \
	gnome-shell-extension-apps-menu \
	gnome-shell-extension-window-list \
	gnome-shell-extension-launch-new-instance \
	gnome-shell-extension-background-logo \
	gnome-shell-extension-alternate-tab

# Enable extensions
echo "Enabling extensions..."
gnome-shell-extension-tool -e topicons
gnome-shell-extension-tool -e user-theme
gnome-shell-extension-tool -e dash-to-dock

# Configure dash to dock
# Replace 'set' to 'reset' to restore to default if needed.
echo "Configuring gnome-shell-extension-dash-to-dock..."
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize-or-overview
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action cycle-windows

# Configure topicons
echo "Configuring gnome-shell-extension-topicons-plus..."
gsettings set org.gnome.shell.extensions.topicons tray-pos right
set org.gnome.shell.extensions.topicons  tray-order 2

# Setup theme and icons
install_packages \
	arc-theme \
	pop-icon-theme \
	breeze-cursor-theme

# Configure gnome-shell theme and icons
echo "Configuring theme and icons"
gsettings set org.gnome.shell.extensions.user-theme name Arc-Dark
gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
gsettings set org.gnome.desktop.wm.preferences theme Arc-Dark
gsettings set org.gnome.desktop.interface icon-theme Pop
gsettings set org.gnome.desktop.interface cursor-theme Breeze_Snow

# Restart gnome-shell 
echo "Restarting gnome-shell to flush the configurations..."
gnome-shell -r > /dev/null 2>&1 &

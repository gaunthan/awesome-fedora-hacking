#!/usr/bin/env bash

# Install development softwares

# Install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code -y

# Install SpaceVim
sudo dnf install vim -y
curl -sLf https://spacevim.org/install.sh | bash

# Install tilix
sudo dnf install tilix tilix-nautilus -y

# Install API docs tool
sudo dnf install zeal -y

# Install Octave
sudo dnf install octave -y

# Install development tools

# Note: Use `dnf grouplist` to list group
sudo dnf groupinstall "C Development Tools and Libraries" -y
sudo dnf groupinstall "Development Tools" -y
sudo dnf install gcc-c++ make cmake -y

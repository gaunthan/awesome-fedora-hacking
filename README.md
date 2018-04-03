# awesome-fedora-hacking
Hacking your Fedora system, make it awesome! :-D

You can download the scripts by

	curl -LO https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/hack-gnome-shell.sh

or directly run it by

	curl -sLf https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/hack-gnome-shell.sh | bash

Replace `hack-gnome-shell.sh` with script you want to have.

## hack-gnome-shell.sh
This script will hach your gnome shell, adding extensions and themes to make it more convenient and elegant. You will get an awesome shell in the end. 
### Installed packages
#### Extensions

- gnome-shell-extension-user-theme
- gnome-shell-extension-dash-to-dock
- gnome-shell-extension-topicons-plus

#### Themes

- arc-theme
- pop-icon-theme
- breeze-cursor-theme

### Removed packages

- gnome-shell-extension-apps-menu
- gnome-shell-extension-dash-window-list
- gnome-shell-extension-launch-new-instance
- gnome-shell-extension-background-logo
- gnome-shell-extension-alternative-tab

Above packages see very little use, so I decide to remove them. Comment corresponding lines to avoid removement.

### Configurations
This script will configure your gnome shell's appearance as shown

![](./images/hack-gnome-shell-screenshot-appearance.png)

with enabled extensions

![](./images/hack-gnome-shell-screenshot-enabled-extensions.png)

### Screenshots
#### Desktop

![](./images/hack-gnome-shell-screenshot-desktop.png)

#### Preview

![](./images/hack-gnome-shell-screenshot-preview.png)

## dynamic-panel-transparency.sh
Thanks to rockon999, for sharing such awesome extension! Repository address: [rockon999/dynamic-panel-transparency](https://github.com/rockon999/dynamic-panel-transparency).

### Installation
Run the follwing command to install the extension:

	curl -sLf https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/dynamic-panel-transparency.sh | bash

### Screenshots
Pay attention to the top bar, you will see the changes.

#### Desktop

![](./images/dynamic-panel-transparency-screenshot-desktop.png)

#### Preview

![](./images/dynamic-panel-transparency-screenshot-preview.png)

## coding-is-life.sh
Install essential and generic developemt tools and softwares, building an out-of-the-box environment for programmer.

### Installation
Run the follwing command to install:

	curl -sLf https://raw.githubusercontent.com/gaunthan/coding-is-life.sh | bash


## prompt-soul.sh
A Powerline like prompt for Bash:

![](./images/prompt-soul-screenshot-sample.png)

Run the follwing command to install:

	curl -sLf https://raw.githubusercontent.com/gaunthan/prompt-soul.sh | bash

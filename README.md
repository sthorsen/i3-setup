Playbook setting up 18.04/19.04 with i3 and more from minimal installation
==========================================================================
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
    - sshd
    - Maybe you need to run this command on the remote machine: `ln -s /usr/bin/python3 /usr/bin/python`
    - Your ssh public key added to root on the remote machine

![Screenshot](https://github.com/sthorsen/i3-setup/blob/master/screenshot_i3-setup.png)

Thanks to:
==========

- [Hypebeast](https://github.com/hypebeast/ansible-i3) - Inspiration
- [Luke Smith XYZ](https://github.com/LukeSmithxyz) - ST
- [Atrus7](https://github.com/Atrus7) - i3lock
- [Schischi](https://github.com/schischi) - xcwd
- [Tobi-wan-kenobi](https://github.com/tobi-wan-kenobi) - bumblebee-status
- [Gabrielelana](https://github.com/gabrielelana/awesome-terminal-fonts) - awesome-terminal-fonts

Playbook roles: (Listed in install order)
===============
- [init](https://github.com/sthorsen/i3-setup#init)
- [dm](https://github.com/sthorsen/i3-setup#dm)
- [i3](https://github.com/sthorsen/i3-setup#i3)
- [i3lock](https://github.com/sthorsen/i3-setup#i3lock)
- [themes](https://github.com/sthorsen/i3-setup#themes)
- [utilities](https://github.com/sthorsen/i3-setup#utilities)
- [clusterssh](https://github.com/sthorsen/i3-setup#clusterssh)
- [google-chrome](https://github.com/sthorsen/i3-setup#google-chrome)
- [slack-desktop](https://github.com/sthorsen/i3-setup#slack-desktop)
- [nvidia-driver](https://github.com/sthorsen/i3-setup#nvidia-driver)
- [docker-ce](https://github.com/sthorsen/i3-setup#docker-ce)
- [power-management](https://github.com/sthorsen/i3-setup#power-management)
- [grub](https://github.com/sthorsen/i3-setup#grub)
- [cleanup](https://github.com/sthorsen/i3-setup#cleanup)


init
----
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
- Tasks
    - Creating user
    - Deploing ssh keys
    - Install som required packages
    - Clone and compile ST (Simple Terminal) from Luke Smith if `terminal` is set to `st` in `var/default.yaml`

dm
---
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
- Tasks
    - Install lightdm package

i3
---
- Requirements

- Tasks
    - Install i3 package and other required packages (See vars/default.yaml)
    - Create .i3 config dir
    - Deploing i3 config

i3lock
------
- Requirements
    - i3 role, or i3 config with `#lock screen` tag
    - init role
- Tasks
    - Installing required packages for i3lock
    - Clone and compile i3lock from Atrus7
    - Deploing scripts
    - Adding behavioer to i3 config
    - Deploing emojis if `src_i3lock_emoji_dir` is set to a path on local machine. Not target machine
      Else it will use emojis from Atrus7 repo

themes
------
- Requirements
    - i3 role, or i3 config with `#bar` tag
    - init role
- Tasks
    - Installing required packages
    - Deploing configs, scripts, fonts and backgrounds
    - Clone and installing awesome-terminal-fonts from my own fork on github
    - Clone bumblebee-status from my own fork on github
    - Adding bumblebee-status bar to i3 config
    - if Ubuntu 18.04: Clone and compile xcwd from Schischi
    - if Ubuntu 19.04: Install xcwd package

utilities
---------
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
- Tasks
    - Installing required packages
    - Installing network packages
    - Installing Python libraries
    - Deploy .vimrc

clusterssh
----------
- Requirements
    - i3 role, or i3 config with `#clusterssh` tag
- Tasks
    - Installing clusterssh
    - Deploing cluster config
    - Adding behavioer to i3 config

google-chrome
-------------
- Requirements
    - X11
- Tasks
    - Adding google apt source
    - installing google-chrome-stable package

slack-desktop
-------------
- Requirements
    - X11
- Tasks
    - Adding slack apt source
    - installing slack-desktop package

nvidia-driver
-------------
- Requirements
    - Nvidia grafic card
- Tasks
    - Looking for Nvidia VGA, if not found. It will do noghing
    - Adding driver apt repository
    - Installing nvidia headless driver v. 418

docker-ce
---------
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
- Tasks
    - Adding Docker apt source
    - Installing docker-ce and required packages
    - Adding user to docker group

power-management
----------------
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
- Tasks
    - Installing some packages for power management. Might only be usefull for laptops

grub
----
- Requirements
    - grub bootloader
- Tasks
    - Removing quiet and splash screen on boot

cleanup
-------
- Requirements
    - Ubuntu 18.04/19.04
    - Other DEB based Linux distros might work, but has not been tested
- Tasks
    - Removing thunderbird packages
    - Removing modemmanager packages
    - Removing postfix packages
    - Removing gnome packages
    - Removing packages with not requirements
    - Cleaning apt cache
    - Making sure libvirt-qemu user will not show up in login screen


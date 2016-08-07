#version=DEVEL

## Bardora - Kosieh Barter Spin based on Fedora

## Basic URL
url --url=http://mirror.vutbr.cz/fedora/releases/$releasever/Everything/$basearch/os/

# X-Window and related
xconfig --startxonboot

# System services
services --enabled="chronyd"

%packages

## BASICS
@^basic-desktop-environment
@editors
@system-tools
chrony

# Web, PDF and related
firefox
evince
hexchat

# Audio
audacious
ladspa
ladspa-caps-plugins
ladspa-rev-plugins

# System tools
lxterminal
lxpanel # basic panel from LXDE as a backup, when something fails.
pcmanfm
beesu
file-roller
p7zip
gmrun

# Storage related
fuse-sshfs
blivet-gui
gparted # BACKUP!

# Storage - fylesystems
gvfs-mtp
simple-mtpfs

# Network Manager related
NetworkManager-tui
NetworkManager-wifi
NetworkManager-ssh
NetworkManager-pptp
NetworkManager-l2tp
NetworkManager-openvpn
NetworkManager-bluetooth


# Network Manager - GUI
NetworkManager-openvpn-gnome
NetworkManager-ssh-gnome
NetworkManager-l2tp-gnome
NetworkManager-pptp-gnome
nm-connection-editor

# Settings for Openbox
obconf

%end

## Anaconda overrides
%anaconda
pwpolicy root --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy user --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
%end

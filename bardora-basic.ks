# Fedora - Kosieh Barter Spin

## BASIC REPOSITORY - MODIFY TO SUIT YOUR NEEDS!
repo --name=fimuni --baseurl=ftp://ftp.fi.muni.cz/pub/linux/fedora/linux/releases/24/Everything/x86_64/os/

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
slock # Simple lock invoked by same command.
pcmanfm
beesu
file-roller
p7zip
gmrun

# Storage related
fuse-sshfs
blivet-gui
gparted # BACKUP!

# Network Manager related
NetworkManager-tui
NetworkManager-wifi
NetworkManager-ssh
NetworkManager-pptp
NetworkManager-openvpn
NetworkManager-bluetooth

#Network Manager - GUI
NetworkManager-openvpn-gnome
NetworkManager-ssh-gnome
NetworkManager-l2tp-gnome
NetworkManager-pptp-gnome
nm-connection-editor

%end

## Anaconda overrides
%anaconda
pwpolicy root --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy user --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
%end

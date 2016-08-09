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

%post
# Set PCManFM as default file manager directly.
sed -i 's/Konqueror/PCManFM/' /etc/xdg/openbox/rc.xml
sed -i 's/kfmclient\ openProfile\ filemanagement/pcmanfm/' /etc/xdg/openbox/rc.xml

# Set locking command
sed -i 's/<\/keyboard>/\n<keybind key="W-l"><action name="Execute"><command>dm-tool lock<\/command><\/action><\/keybind>\n<\/keyboard>/' /etc/xdg/openbox/rc.xml

# Set run dialog command
sed -i 's/<\/keyboard>/\n<keybind key="W-r"><action name="Execute"><command>gmrun<\/command><\/action><\/keybind>\n<\/keyboard>/' /etc/xdg/openbox/rc.xml

# Append several data so user can mount internal devices
touch /etc/polkit-1/localauthority/50-local.d/50-filesystem-mount-system-internal.pkla
echo "[Mount a system-internal device]" >> /etc/polkit-1/localauthority/50-local.d/50-filesystem-mount-system-internal.pkla
echo "Identity=*" >> /etc/polkit-1/localauthority/50-local.d/50-filesystem-mount-system-internal.pkla
echo "Action=org.freedesktop.udisks2.*" >> /etc/polkit-1/localauthority/50-local.d/50-filesystem-mount-system-internal.pkla
echo "ResultActive=yes" >> /etc/polkit-1/localauthority/50-local.d/50-filesystem-mount-system-internal.pkla

%end

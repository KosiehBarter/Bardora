## DO NOT USE - WIP!

%packages

# File management
caja

# NetworkManager and related
NetworkManager
NetworkManager-tui

# Hardware-typed networking
NetworkManager-wifi

# Subnetworks
NetworkManager-ssh
NetworkManager-openvpn
NetworkManager-l2tp
NetworkManager-libreswan
NetworkManager-iodine
NetworkManager-openconnect
NetworkManager-pptp
NetworkManager-vpnc

# Tools related to terminals and terminal-like
tilda
android-tools
gmrun
beesu

# Text editor
geany

# Internet and related
firefox
hexchat

# Archivation
file-roller
p7zip
bzip2-static

# Tint2 panel
tint2

# Storage - fylesystems
gvfs-mtp
simple-mtpfs

%end


#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=ens3 --ipv6=auto --activate
network  --hostname=localhost.localdomain
# Root password
rootpw --iscrypted $6$pI5ZshJK4i6I2T3w$D0N9NQrp94RW/SU/sFvryZV9lmNDGmJqZd7TvthBW1d2cQqDn2jT7WKDfjtVzNgqJVIQP38dBH5CqsI932iIM0
# System services
services --enabled="chronyd"
# System timezone
timezone Europe/Prague --isUtc
user --groups=wheel --name=kosieh --password=$6$5ZqQXauENcukS4HP$xk8YMP7z7rWv4CAj1ObDBjDWhEnuyWBHD/KXci0jfHsG5uUKm1rdq18YP/uiUIoUU09wJ2VOosdyS5gEwU8EE/ --iscrypted --gecos="kosieh"
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives=sda

%packages
@^basic-desktop-environment
chrony

%end

%addon com_redhat_kdump --disable --reserve-mb='128'

%end

%anaconda
pwpolicy root --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy user --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=0 --minquality=1 --notstrict --nochanges --emptyok
%end


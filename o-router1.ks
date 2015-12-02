# text mode - no graphical interface
text

# install
install

# Install source
url --url=http://mirror.csclub.uwaterloo.ca/centos/7/os/x86_64/
repo --name="Centos 7" --baseurl=http://mirror.csclub.uwaterloo.ca/centos/7/os/x86_64/ --cost=100

# Language support
lang en_US.UTF-8

# Keyboard
keyboard us

# Security
rootpw changeme

# Firewall
firewall --disabled

# SElinux
selinux --disabled

# auth config
authconfig --enableshadow --enablemd5

# Timezone
timezone America/Toronto

# bootloader
bootloader --location=mbr --append="rhgb quiet"

# Users
user --name=jeanbal --groups=wheel

# Network
# eth1 is the public interface
# eth2 is the internal interface
network --device eth1 --bootproto static --ip 10.5.5.245 --netmask 255.255.255.0 --gateway 10.5.5.1 --nameserver 8.8.8.8 --noipv6 --hostname o-router1
network --device eth0 --bootproto static --ip 192.168.9.1 --netmask 255.255.255.0

# Partitioning and filesystems

zerombr
clearpart --all --initlabel
part /boot --fstype xfs --size=250 --ondisk=vda --asprimary
part pv.3 --size=250 --grow --ondisk=vda
volgroup vg01 pv.3
#
logvol / --fstype xfs --name=lv01 --vgname=vg01 --size=3072 --grow
logvol swap --fstype swap --name=swaplv01 --vgname=vg01 --size=1024

# Packages
%packages
vim-enhanced
lvm2
e2fsprogs
screen
sudo
ntp
nfs-utils
net-tools
%end

%post
#chvt 3
%end

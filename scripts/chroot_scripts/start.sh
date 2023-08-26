#!/bin/bash

export NOW=$(date +'%Y/%m/%d/%R')

mkdir -p /{boot,home,mnt,opt,srv}
mkdir -p /etc/{opt,sysconfig}
mkdir -p /lib/firmware
mkdir -p /media/{floppy,cdrom}
mkdir -p /usr/{,local/}{include,src}
mkdir -p /usr/local/{bin,lib,sbin}
mkdir -p /usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -p /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -p /usr/{,local/}share/man/man{1..8}
mkdir -p /var/{cache,local,log,mail,opt,spool}
mkdir -p /var/lib/{color,misc,locate}
mkdir -p /sources/log/$NOW

ln -sfv /run /var/run
ln -sfv /run/lock /var/lock

install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp

if [ ! -f /etc/mtab ]; then
	ln -sv /proc/self/mounts /etc/mtab
fi

if [ ! -f /etc/passwd ]; then
	cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/usr/bin/false
daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
tester:x:101:101::/home/tester:/bin/bash
EOF
fi

if [ ! -f /etc/group ]; then
	cat > /etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuidd:x:80:
wheel:x:97:
users:x:999:
nogroup:x:65534:
tester:x:101:
EOF
fi

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp


source /sources/scripts/gettext.sh |& tee /sources/log/$NOW/gettext.log
source /sources/scripts/bison.sh |& tee /sources/log/$NOW/bison.log
source /sources/scripts/perl.sh |& tee /sources/log/$NOW/perl.log
source /sources/scripts/python.sh |& tee /sources/log/$NOW/python.log
source /sources/scripts/texinfo.sh |& tee /sources/log/$NOW/texinfo.log
source /sources/scripts/util_linux.sh |& tee /sources/log/$NOW/util_linux.log

rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete


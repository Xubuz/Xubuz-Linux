#!/bin/bash

source lfs_vars.sh

if [ "$EUID" -ne 0 ]
  then echo "RUN THE SCRIPT AS SUPERUSE. NOT AS SUDO BUT PREFERABLY INSIDE SUDO SU"
  exit
fi


losetup /dev/loop20 $LFS/../os_boot.loop
losetup /dev/loop21 $LFS/../os_root.loop

mount /dev/loop21 $LFS

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}

mkdir -p $LFS/{dev,proc,sys,run,shm}

mount -B /dev $LFS/dev
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run
mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm

#For Setting up scripts that are required inside chroot.
mkdir -p $LFS/sources/scripts
cp -r $LFS/../scripts/chroot_scripts/* $LFS/sources/scripts

chroot "$LFS" /usr/bin/env -i \
	HOME=/root \
	TERM="$TERM" \
	PS1='(lfs chroot) \u:\w\$ ' \
	PATH=/usr/bin:/usr/sbin \
	/bin/bash --login

echo "Exiting LFS Chroot"

umount -l $LFS/dev
umount -l $LFS/

losetup -d /dev/loop20
losetup -d /dev/loop21




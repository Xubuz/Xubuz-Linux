#!/bin/bash

# THIS VARIABLE POINTS TO THE DIRECTORY WHERE THE LFS BUILD
# SHOULD BE MOUNTED. IF LFS VARIABLE IS NOT SET THEN THE BUILD
# WILL FAIL SHOWING AN ERROR.
export LFS=

# THIS VARIABLE SHOULD SPECIFY THE TARGET SYSTEM NAME.
# FOR EXAMPLE IT CAN BE x86_64-xxx-xxx-xxx i.e., x86_64-lfs-linux-gnu .
export LFS_TGT=x86_64-lfs-linux-gnu

# DO EDIT THESE VARIABLES UNLESS YOU KNOW WHAT YOU ARE DOING.
export SCRIPTS=$LFS/../scripts
export NOW=$(date +'%Y/%m/%d/%R')
export SCRIPTS=$LFS/../scripts
export PATH=$PATH:$LFS/tools/bin

if [ "$LFS" == "" ]; then
	echo "ERROR: PLEASE DEFINE THE LFS VARIABLE IN \"lfs_vars.sh\" FILE"
	exit 1
fi

if [ "$LFS_TGT" == "" ]; then
	echo "PLEASE DEFINE THE LFS_TGT VARIABLE IN \"lfs_vars.sh\" FILE"
	exit 1
fi



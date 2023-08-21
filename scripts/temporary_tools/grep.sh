#!/bin/bash

# For compiling GREP
if [ -d $LFS/sources/compiling_area/grep ]; then
	echo "[COMPILED] GREP"

else
	echo "[COMPILING] GREP"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/grep

	tar -xf $LFS/sources/packages/grep-3.8.tar.xz -C $LFS/sources/compiling_area/grep

	pushd $LFS/sources/compiling_area/grep/grep-3.8
        ./configure --prefix=/usr --host=$LFS_TGT && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

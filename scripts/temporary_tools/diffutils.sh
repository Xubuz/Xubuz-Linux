#!/bin/bash

# For compiling DIFFUTILS
if [ -d $LFS/sources/compiling_area/diffutils ]; then
	echo "[COMPILED] DIFFUTILS"

else
	echo "[COMPILING] DIFFUTILS"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/diffutils

	tar -xf $LFS/sources/packages/diffutils-3.9.tar.xz -C $LFS/sources/compiling_area/diffutils

	pushd $LFS/sources/compiling_area/diffutils/diffutils-3.9
        	./configure --prefix=/usr --host=$LFS_TGT && ERROR_EXIT
        
        	make && ERROR_EXIT
        	make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

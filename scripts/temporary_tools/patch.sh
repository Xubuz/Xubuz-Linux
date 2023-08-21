#!/bin/bash

# For compiling PATCH
if [ -d $LFS/sources/compiling_area/patch ]; then
	echo "[COMPILED] PATCH"

else
	echo "[COMPILING] PATCH"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/patch

	tar -xf $LFS/sources/packages/patch-2.7.6.tar.xz -C $LFS/sources/compiling_area/patch

	pushd $LFS/sources/compiling_area/patch/patch-2.7.6
        ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

#!/bin/bash

# For compiling FINDUTILS
if [ -d $LFS/sources/compiling_area/findutils ]; then
	echo "[COMPILED] FINDUTILS"

else
	echo "[COMPILING] FINDUTILS"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/findutils

	tar -xf $LFS/sources/packages/findutils-4.9.0.tar.xz -C $LFS/sources/compiling_area/findutils

	pushd $LFS/sources/compiling_area/findutils/findutils-4.9.0
        ./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess) && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

#!/bin/bash

# For compiling XZ
if [ -d $LFS/sources/compiling_area/xz ]; then
	echo "[COMPILED] XZ"

else
	echo "[COMPILING] XZ"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/xz

	tar -xf $LFS/sources/packages/xz-5.4.1.tar.xz -C $LFS/sources/compiling_area/xz

	pushd $LFS/sources/compiling_area/xz/xz-5.4.1
        ./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.1 && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
        rm -v $LFS/usr/lib/liblzma.la
	popd
fi

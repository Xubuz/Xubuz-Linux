#!/bin/bash

# For compiling GZIP
if [ -d $LFS/sources/compiling_area/gzip ]; then
	echo "[COMPILED] GZIP"

else
	echo "[COMPILING] GZIP"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/gzip

	tar -xf $LFS/sources/packages/gzip-1.12.tar.xz -C $LFS/sources/compiling_area/gzip

	pushd $LFS/sources/compiling_area/gzip/gzip-1.12
        ./configure --prefix=/usr --host=$LFS_TGT && ERROR_EXIT
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

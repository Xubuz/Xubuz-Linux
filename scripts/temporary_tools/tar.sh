#!/bin/bash

# For compiling TAR
if [ -d $LFS/sources/compiling_area/tar ]; then
	echo "[COMPILED] TAR"

else
	echo "[COMPILING] TAR"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/tar

	tar -xf $LFS/sources/packages/tar-1.34.tar.xz -C $LFS/sources/compiling_area/tar

	pushd $LFS/sources/compiling_area/tar/tar-1.34
        ./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

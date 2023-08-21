#!/bin/bash

# For compiling GAWK
if [ -d $LFS/sources/compiling_area/gawk ]; then
	echo "[COMPILED] GAWK"

else
	echo "[COMPILING] GAWK"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/gawk

	tar -xf $LFS/sources/packages/gawk-5.2.1.tar.xz -C $LFS/sources/compiling_area/gawk

	pushd $LFS/sources/compiling_area/gawk/gawk-5.2.1
        sed -i 's/extras//' Makefile.in
        ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) && ERROR_EXIT
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

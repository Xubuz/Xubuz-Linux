#!/bin/bash

if [ -d $LFS/sources/compiling_area/binutils ]; then
	echo "[COMPILED] BINUTILS"

else
	echo "[COMPILING] BINUTILS"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/binutils
	tar -xf $LFS/sources/packages/binutils-2.40.tar.xz -C $LFS/sources/compiling_area/binutils
	
	pushd $LFS/sources/compiling_area/binutils/binutils-2.40
		
		mkdir -pv build
		pushd build
		
			../configure --prefix=$LFS/tools \
				--with-sysroot=$LFS \
				--target=$LFS_TGT \
				--disable-nls \
				--enable-gprofng=no \
				--disable-werror && ERROR_EXIT
			make && ERROR_EXIT
			make install && ERROR_EXIT
		popd
	popd
fi



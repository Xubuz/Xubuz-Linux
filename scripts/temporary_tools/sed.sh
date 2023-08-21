#!/bin/bash

# For compiling SED
if [ -d $LFS/sources/compiling_area/sed ]; then
	echo "[COMPILED] SED"

else
	echo "[COMPILED] SED"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/sed

	tar -xf $LFS/sources/packages/sed-4.9.tar.xz -C $LFS/sources/compiling_area/sed

	pushd $LFS/sources/compiling_area/sed/sed-4.9
        ./configure --prefix=/usr --host=$LFS_TGT && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
	popd
fi

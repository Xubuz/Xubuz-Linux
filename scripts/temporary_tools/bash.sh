#!/bin/bash

# For compiling BASH
if [ -d $LFS/sources/compiling_area/bash ]; then
	echo "[COMPILED] BASH"

else
	echo "[COMPILING] BASH"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/bash

	tar -xf $LFS/sources/packages/bash-5.2.15.tar.gz -C $LFS/sources/compiling_area/bash

	pushd $LFS/sources/compiling_area/bash/bash-5.2.15
        ./configure --prefix=/usr \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT \
            --without-bash-malloc && ERROR_EXIT
        
        make && ERROR_EXIT
        make DESTDIR=$LFS install && ERROR_EXIT
        ln -sfv bash $LFS/bin/sh
	popd
fi

#!/bin/bash

# For compiling FILE
if [ -d $LFS/sources/compiling_area/file ]; then
	echo "[COMPILED] FILE"

else
	echo "[COMPILING] FILE"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/file

	tar -xf $LFS/sources/packages/file-5.44.tar.gz -C $LFS/sources/compiling_area/file

	pushd $LFS/sources/compiling_area/file/file-5.44
                mkdir build
                pushd build
                        ../configure --disable-bzlib      \
                                --disable-libseccomp \
                                  --disable-xzlib      \
                                  --disable-zlib && ERROR_EXIT
                        make && ERROR_EXIT
                popd

                ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) && ERROR_EXIT
                make FILE_COMPILE=$(pwd)/build/src/file && ERROR_EXIT
                make DESTDIR=$LFS install && ERROR_EXIT
                rm -v $LFS/usr/lib/libmagic.la && ERROR_EXIT
	popd
fi

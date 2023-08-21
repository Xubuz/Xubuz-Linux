#!/bin/bash

if [ -d $LFS/sources/compiling_area/libstdc++ ]; then
	echo "[COMPILED] LIBSTDC++"

else
	echo "[COMPILING] LIBSTDC++"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/libstdc++

	tar -xf $LFS/sources/packages/gcc-12.2.0.tar.xz -C $LFS/sources/compiling_area/libstdc++

	pushd $LFS/sources/compiling_area/libstdc++/gcc-12.2.0

        mkdir -p build
        pushd build

            ../libstdc++-v3/configure \
                --host=$LFS_TGT \
                --build=$(../config.guess) \
                --prefix=/usr \
                --disable-multilib \
                --disable-nls \
                --disable-libstdcxx-pch \
                --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0 && ERROR_EXIT

            make && ERROR_EXIT
            make DESTDIR=$LFS install && ERROR_EXIT

            rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la
        popd

	popd
fi



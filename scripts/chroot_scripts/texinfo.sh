#!/bin/bash

# For compiling TEXINFO
if [ -d /sources/compiling_area/texinfo-chroot ]; then
	echo "TEXINFO has already been compiled."

else
	echo "compiling TEXINFO"
	sleep 5
	mkdir -pv /sources/compiling_area/texinfo-chroot

	tar -xf /sources/packages/texinfo-7.0.2.tar.xz -C /sources/compiling_area/texinfo-chroot

	pushd /sources/compiling_area/texinfo-chroot/texinfo-7.0.2
        	./configure --prefix=/usr
            make
            make install
	popd
fi


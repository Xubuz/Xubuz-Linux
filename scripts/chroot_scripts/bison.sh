#!/bin/bash

# For compiling BISON
if [ -d /sources/compiling_area/bison-chroot ]; then
	echo "BISONN has already been compiled."

else
	echo "compiling BISON"
	sleep 5
	mkdir -pv /sources/compiling_area/bison-chroot

	tar -xf /sources/packages/bison-3.8.2.tar.xz -C /sources/compiling_area/bison-chroot

	pushd /sources/compiling_area/bison-chroot/bison-3.8.2
        	./configure --prefix=/usr \
			--docdir=/usr/share/doc/bison-3.8.2
		make
		make install
	popd
fi


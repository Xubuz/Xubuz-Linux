#!/bin/bash

# For compiling PYTHON
if [ -d /sources/compiling_area/python-chroot ]; then
	echo "PYTHON has already been compiled."

else
	echo "compiling PYTHON"
	sleep 5
	mkdir -pv /sources/compiling_area/python-chroot

	tar -xf /sources/packages/Python-3.11.2.tar.xz -C /sources/compiling_area/python-chroot

	pushd /sources/compiling_area/python-chroot/Python-3.11.2
        	./configure --prefix=/usr \
                --enable-shared \
                --without-ensurepip
            make
            make install
	popd
fi


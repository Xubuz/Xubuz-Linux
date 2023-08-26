#!/bin/bash

# For compiling UTILS LINUX
if [ -d /sources/compiling_area/util_linux-chroot ]; then
	echo "UTIL LINUX has already been compiled."

else
	echo "compiling UTILS LINUX"
	sleep 5
	mkdir -pv /sources/compiling_area/util_linux-chroot

	tar -xf /sources/packages/util-linux-2.38.1.tar.xz -C /sources/compiling_area/util_linux-chroot

	pushd /sources/compiling_area/util_linux-chroot/util-linux-2.38.1
        	mkdir -pv /var/lib/hwclock
            ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
                --libdir=/usr/lib \
                --docdir=/usr/share/doc/util-linux-2.38.1 \
                --disable-chfn-chsh \
                --disable-login \
                --disable-nologin \
                --disable-su \
                --disable-setpriv \
                --disable-runuser \
                --disable-pylibmount \
                --disable-static \
                --without-python \
                runstatedir=/run
            make
            make install
	popd
fi


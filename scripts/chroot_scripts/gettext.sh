#!/bin/bash

# For compiling GETTEXT
if [ -d /sources/compiling_area/gettext-chroot ]; then
	echo "GETTEXT has already been compiled."

else
	echo "compiling GETTEXT"
	sleep 5
	mkdir -pv /sources/compiling_area/gettext-chroot

	tar -xf /sources/packages/gettext-0.21.1.tar.xz -C /sources/compiling_area/gettext-chroot

	pushd /sources/compiling_area/gettext-chroot/gettext-0.21.1
        	./configure --disable-shared
        	make
		cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
	popd
fi


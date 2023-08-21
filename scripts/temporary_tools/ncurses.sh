#!/bin/bash

# For compiling NCURSES
if [ -d $LFS/sources/compiling_area/ncurses ]; then
	echo "[COMPILED] NCURSES" |& tee $LFS/../log/$NOW/ncurses.log

else
	echo "[COMPILING] NCURSES"
	sleep 5
	mkdir -pv $LFS/sources/compiling_area/ncurses

	tar -xf $LFS/sources/packages/ncurses-6.4.tar.gz -C $LFS/sources/compiling_area/ncurses

	pushd $LFS/sources/compiling_area/ncurses/ncurses-6.4

        mkdir build
		pushd build
			../configure && ERROR_EXIT
			make -C include && ERROR_EXIT
			make -C progs tic && ERROR_EXIT
		popd

		./configure --prefix=/usr \
			--host=$LFS_TGT \
			--build=$(./config.guess) \
			--mandir=/usr/share/man \
			--with-manpage-format=normal \
			--with-shared \
			--without-normal \
			--with-cxx-shared \
			--without-debug \
			--without-ada \
			--disable-stripping \
			--enable-widec && ERROR_EXIT

        	make && ERROR_EXIT
		make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install && ERROR_EXIT
		echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
	popd
fi


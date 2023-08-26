#!/bin/bash

# For compiling PERL
if [ -d /sources/compiling_area/perl-chroot ]; then
	echo "PERL has already been compiled."

else
	echo "compiling PERL"
	sleep 5
	mkdir -pv /sources/compiling_area/perl-chroot

	tar -xf /sources/packages/perl-5.36.0.tar.xz -C /sources/compiling_area/perl-chroot

	pushd /sources/compiling_area/perl-chroot/perl-5.36.0
        	sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl     \
             -Darchlib=/usr/lib/perl5/5.36/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl
            make
            make install
	popd
fi


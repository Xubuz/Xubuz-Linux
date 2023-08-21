#!/bin/bash

source lfs_vars.sh

ERROR_EXIT () {
	if [ "$?" != "0" ]; then
		echo "ERROR: EXITING WITH COMPILATION ERROR"
		exit 1		
	fi
}

export -f ERROR_EXIT

mkdir -p $LFS
mkdir -p $LFS/../log/$NOW


# PRELIMINARY SCRIPTS FOR SETTING UP BUILD DISK AND FILESYSTEM
source $SCRIPTS/build_preparation/setup_build_disk.sh
source $SCRIPTS/build_preparation/setup_file_system.sh

# DOWNLOADING PACKAGES AND PATCHES
python3 $SCRIPTS/packages.py

# COMPILING COMPILER TOOLCHAIN
source $SCRIPTS/cross_tool_chain/binutils.sh |& tee $LFS/../log/$NOW/binutils.log
source $SCRIPTS/cross_tool_chain/gcc.sh |& tee $LFS/../log/$NOW/gcc.log
source $SCRIPTS/cross_tool_chain/linux_api_headers.sh |& tee $LFS/../log/$NOW/linux_api_headers.log
source $SCRIPTS/cross_tool_chain/glibc.sh |& tee $LFS/../log/$NOW/glibc.log
source $SCRIPTS/cross_tool_chain/libstdc++.sh |& tee $LFS/../log/$NOW/libstdc++.log

# COMPILING PACKAGES USING ALREADY COMPILED TOOLCHAIN FROM PREVIOUS STEP
source $SCRIPTS/temporary_tools/m4.sh |& tee $LFS/../log/$NOW/binutils.log
source $SCRIPTS/temporary_tools/ncurses.sh |& tee $LFS/../log/$NOW/binutils.log
source $SCRIPTS/temporary_tools/bash.sh |& tee $LFS/../log/$NOW/bash.log
source $SCRIPTS/temporary_tools/coreutils.sh |& tee $LFS/../log/$NOW/coreutils.log
source $SCRIPTS/temporary_tools/diffutils.sh |& tee $LFS/../log/$NOW/diffutils.log
source $SCRIPTS/temporary_tools/findutils.sh |& tee $LFS/../log/$NOW/findutils.log
source $SCRIPTS/temporary_tools/file.sh |& tee $LFS/../log/$NOW/file.log
source $SCRIPTS/temporary_tools/gawk.sh |& tee $LFS/../log/$NOW/gawk.log
source $SCRIPTS/temporary_tools/grep.sh |& tee $LFS/../log/$NOW/grep.log
source $SCRIPTS/temporary_tools/gzip.sh |& tee $LFS/../log/$NOW/gzip.log
source $SCRIPTS/temporary_tools/make.sh |& tee $LFS/../log/$NOW/make.log
source $SCRIPTS/temporary_tools/sed.sh |& tee $LFS/../log/$NOW/sed.log
source $SCRIPTS/temporary_tools/tar.sh |& tee $LFS/../log/$NOW/tar.log
source $SCRIPTS/temporary_tools/tar.sh |& tee $LFS/../log/$NOW/tar.log
source $SCRIPTS/temporary_tools/xz.sh |& tee $LFS/../log/$NOW/xz.log
source $SCRIPTS/temporary_tools/patch.sh |& tee $LFS/../log/$NOW/patch.log
source $SCRIPTS/temporary_tools/binutils.sh |& tee $LFS/../log/$NOW/binutils-pass2.log
source $SCRIPTS/temporary_tools/gcc.sh |& tee $LFS/../log/$NOW/gcc-pass2.log

# THE BUILD DISK IS UNMOUNTED HERE.
source $SCRIPTS/build_preparation/unmount_build_disk.sh


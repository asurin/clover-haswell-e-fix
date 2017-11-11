#!/bin/bash
CLOVER_LOCATION="/Users/asurin/src/edk2/Clover"
PATCH_LOCATION="/Users/asurin/Development/clover-haswell-e-fix/patch"
REVISION=$(svn info $CLOVER_LOCATION 2>&1 | awk '/^Revision:/ {print $2}')


rm $PATCH_LOCATION/*.patch
svn diff -x -w -r $REVISION $CLOVER_LOCATION/rEFIt_UEFI/Platform/kernel_patcher.c > $PATCH_LOCATION/kernel_patcher.c.patch
svn diff -x -w -r $REVISION $CLOVER_LOCATION/rEFIt_UEFI/Platform/kext_patcher.c > $PATCH_LOCATION/kext_patcher.c.patch
svn diff -x -w -r $REVISION $CLOVER_LOCATION/rEFIt_UEFI/Platform/Settings.c > $PATCH_LOCATION/Settings.c.patch
svn diff -x -w -r $REVISION $CLOVER_LOCATION/rEFIt_UEFI/refit/lib.h > $PATCH_LOCATION/lib.h.patch
svn diff -x -w -r $REVISION $CLOVER_LOCATION/rEFIt_UEFI/refit/main.c > $PATCH_LOCATION/main.c.patch

echo "Created patch from $REVISION@$CLOVER_LOCATION to $PATCH_LOCATION"

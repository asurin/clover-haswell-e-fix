#!/bin/bash
PATCH_LOCATION="/Users/asurin/Development/clover-haswell-e-fix/patch"
SOURCE_LOCATION="/Users/asurin/src/edk2/Clover"

rm $SOURCE_LOCATION/rEFIt_UEFI/Platform/*.orig
rm $SOURCE_LOCATION/rEFIt_UEFI/Platform/*.rej
rm $SOURCE_LOCATION/rEFIt_UEFI/refit/*.orig
rm $SOURCE_LOCATION/rEFIt_UEFI/refit/*.rej
patch -p0 -i $PATCH_LOCATION/kernel_patcher.c.patch
patch -p0 -i $PATCH_LOCATION/Settings.c.patch
patch -p0 -i $PATCH_LOCATION/lib.h.patch
patch -p0 -i $PATCH_LOCATION/main.c.patch

echo "Applied patch from $PATCH_LOCATION - you may need to manually resolve merge conflicts"

#!/bin/bash
PATCH_LOCATION="/Users/asurin/src/edk2/Clover"

TARGET_REV=$(svn info $CLOVER_LOCATION 2>&1 | awk '/^Revision:/ {print $2}')

rm $PATCH_LOCATION/rEFIt_UEFI/Platform/kernel_patcher.c
rm $PATCH_LOCATION/rEFIt_UEFI/Platform/Settings.c
rm $PATCH_LOCATION/rEFIt_UEFI/refit/lib.h
rm $PATCH_LOCATION/rEFIt_UEFI/refit/main.c
cd $PATCH_LOCATION/rEFIt_UEFI/Platform && svn up -r $TARGET_REV .
cd $PATCH_LOCATION/rEFIt_UEFI/refit && svn up -r $TARGET_REV .
SUGGESTED_CLOVER_REV=$TARGET_REV buildclover

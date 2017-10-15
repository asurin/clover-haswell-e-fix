#!/bin/bash
PATCH_LOCATION="/Users/asurin/src/edk2/Clover"

if [ -z "$TARGET_REV" ]; then
  echo "Please set the rev to reset to as TARGET_REV"
  exit 1
fi

echo "Resetting tree to $TARGET_REV"
cd $PATCH_LOCATION && svn status --no-ignore | grep '^[I?]' | cut -c 9- | while IFS= read -r f; do rm -rf "$f"; done
rm $PATCH_LOCATION/rEFIt_UEFI/Platform/kernel_patcher.c
rm $PATCH_LOCATION/rEFIt_UEFI/Platform/Settings.c
rm $PATCH_LOCATION/rEFIt_UEFI/refit/lib.h
rm $PATCH_LOCATION/rEFIt_UEFI/refit/main.c
cd $PATCH_LOCATION/rEFIt_UEFI/Platform && svn up -r $TARGET_REV .
cd $PATCH_LOCATION/rEFIt_UEFI/refit && svn up -r $TARGET_REV .
SUGGESTED_CLOVER_REV=$TARGET_REV buildclover

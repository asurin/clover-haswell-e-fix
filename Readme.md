# Clover Haswell-E patch (5930k, 5960X)

## Dependencies
- XCode 8 Command line tools (9 will likely work soon)
- buildclover (http://www.insanelymac.com/forum/files/file/589-build-clovercommand/) - make sure it's in your path (Menu option 1)
- *You may need to edit buildclover to comment out the line setting SUGGESTED_CLOVER_REV to a blank value*

## Generate patch
- From a known good revision, run `./create_patch.sh`
- Commit results, along with the revision to this file below

## Apply
- Run `prepare_tree_for_patch.sh`, select option 2, quit
- Run `apply_patch.sh`, fix merge conflicts
- run `SUGGESTED_CLOVER_REV=<new revision> buildclover`, select 5, 1 and then 1
- This clover should be valid.  Assuming it builds and tests out, please go ahead and re-run the steps in _Generate Patch_, update the patch files here and commit

## Current build (suitable host for patch files checked in)
4243

## Previous builds
4220

#!/bin/bash

export SUGGESTED_CLOVER_REV=$(svn info $CLOVER_LOCATION 2>&1 | awk '/^Revision:/ {print $2}')
buildclover

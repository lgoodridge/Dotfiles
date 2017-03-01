#!/bin/bash

# Example Usage: ./copy_random.sh "*_0.mat" 200 "/Users/Lance/thesis/data/data_full/train_3/" "/Users/Lance/thesis/data/data_abr/train_3/"

# Decide find/shuf command to use:
# Regular find is fine for UNIX,
# OS X needs gfind and gshuf from findutils/coreutils
find_command=gfind
shuf_command=gshuf

# If the wrong number of args are provided,
# print proper script usage, then exit.
if [ $# -ne 4 ]; then
    echo "Usage: ./copy_random.sh [SEARCH_PATTERN] [NUMBER] [SOURCE_DIR] [TARGET_DIR]"
    exit 1
fi

search=$1
amount=$2
sourcedir=$3
targetdir=$4

echo "$find_command $sourcedir -name $search -printf '%f\n' | $shuf_command -n $amount | xargs -I{} cp $sourcedir'{}' $targetdir"

$find_command $sourcedir -name $search -printf '%f\n' | $shuf_command -n $amount | xargs -I{} cp $sourcedir'{}' $targetdir


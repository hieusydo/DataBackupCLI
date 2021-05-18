#!/bin/bash
# Author: Hieu Do (hieusydo@gmail.com)
# Date: Feb 2021

#TODO: replace
sourceDir="/Volumes/REPLICA/REPLICA_1"
destDir="/Users/dshieu/REPLICA_2"

waitTime=3

echo "Source is $sourceDir"
echo "Destination is $destDir"
echo "Please verify the source and destination. Starting backup process in $waitTime seconds..."

#sleep $waitTime

log_date=$(date +%Y-%m-%dT%H%M%S)
echo "Current timestamp $log_date"

loopy_rsync() {
    # Use wildcard to list all subdirectories.
    for dir in $sourceDir/*/ 
    do
        # Remove the trailing "/" so that the source subdir structure will be kept.
        dir=${dir%*/}
        # echo "Copying '$dir' to $destDir"
        rsync -av --delete "$dir" "$destDir" >> backup_log_$log_date.txt
    done
}

# GNU Parallel (https://www.gnu.org/software/parallel/)
parallel_rsync_archive_mode() {
    ls "$sourceDir" | parallel -v -j4  rsync -av --delete $sourceDir/{} $destDir > backup_log_$log_date.txt
}

loopy_rsync
#parallel_rsync_archive_mode

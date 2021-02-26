#!/bin/bash
# Author: Hieu Do (hieusydo@gmail.com)
# Date: Feb 2021

#TODO: replace
sourceDir="/Volumes/REPLICA/REPLICA_1"
destDir="/Users/usrA/REPLICA_2"

waitTime=3

echo "Source is $sourceDir"
echo "Destination is $destDir"
echo "Please verify the source and destination. Starting backup process in $waitTime seconds..."

sleep $waitTime

# Use wildcard to list all subdirectories.
for dir in $sourceDir/*/ 
do
    # Remove the trailing "/" so that the source subdir structure will be kept.
    dir=${dir%*/}     echo "Copying '$dir' to $destDir"
    # TODO: add logging option to make it consistent with Windows version
    # TODO: look into multi-thread support
    rsync -av --delete "$dir" "$destDir"
done
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

for dir in $sourceDir/*/    # list directories in the form "/sourceDir/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
    echo "Copying '$dir' to $destDir"
    # TODO: add logging option to make it consistent with Windows version
    # TODO: look into multi-thread support
    rsync -av --delete "$dir" "$destDir"
done
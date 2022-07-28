#!/bin/bash

TARGET_TAG=$1
AOSP_DIRECTORY=$2

WORK_DIRECTORY=$AOSP_DIRECTORY/build/make
cd $WORK_DIRECTORY

# Retrieve the tag right before the target one
PARENT_TAG=$(git describe --abbrev=0 --tags $TARGET_TAG^)

echo "Generating changelog from $PARENT_TAG to $TARGET_TAG"

# Enter the AOSP working directory
cd $AOSP_DIRECTORY

$WORK_DIRECTORY/../aosp.changelog.to/get_gitlog.sh $PARENT_TAG $TARGET_TAG

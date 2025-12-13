#!/bin/sh
# prepare-rootfs.sh - runs in the fakeroot environment to prepare the rootfs image
# The first argument is the path to the target skeleton.

# set -e

TARGET_ROOTFS_DIR=${1}

# We need directories for the overlayfs to work properly
mkdir -p "${TARGET_ROOTFS_DIR}/chroot"
mkdir -p "${TARGET_ROOTFS_DIR}/overlay"
mkdir -p "${TARGET_ROOTFS_DIR}/rom"

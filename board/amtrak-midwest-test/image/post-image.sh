#!/bin/sh
# post-image.sh - build .itb image and disk image

# set -e

BOARD_DIR="$( dirname "${0}" )"
OVERLAYFSDATA_DIR="$( dirname "${0}" )/../overlayfs_data"
MKIMAGE="${HOST_DIR}/bin/mkimage"
IMAGE_ITS="image.its"
OUTPUT_NAME="image.itb"

# We have to copy .its file over to images/ for /incbin/ to work
cp "${BOARD_DIR}/${IMAGE_ITS}" "${BINARIES_DIR}"

cd "${BINARIES_DIR}"

# This will create ${BINARIES_DIR}/${OUTPUT_NAME} FIT image
"${MKIMAGE}" -f ${IMAGE_ITS} ${OUTPUT_NAME}

rm ${IMAGE_ITS}

GENIMAGE="${HOST_DIR}/bin/genimage"
UPDATE_IMAGE_CFG="update_image.cfg"
UPDATE_IMAGE_NAME="update.img"

cp "${BOARD_DIR}/${UPDATE_IMAGE_CFG}" "${BINARIES_DIR}"
cp -r "${OVERLAYFSDATA_DIR}" "${BINARIES_DIR}"
"${GENIMAGE}" --config ${UPDATE_IMAGE_CFG} --inputpath ${BINARIES_DIR}

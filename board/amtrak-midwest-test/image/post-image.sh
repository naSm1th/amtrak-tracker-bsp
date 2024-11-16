#!/bin/sh
# post-image.sh - build .itb image and disk image

set -e

BOARD_DIR="$( dirname "${0}" )"
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
DISK_IMAGE_CFG="disk_image.cfg"
DISK_IMAGE_NAME="disk.img"

cp "${BOARD_DIR}/${DISK_IMAGE_CFG}" "${BINARIES_DIR}"
"${GENIMAGE}" --config ${DISK_IMAGE_CFG} --inputpath ${BINARIES_DIR}
#!/bin/sh

mkdir build
cd build
make defconfig BR2_DEFCONFIG=../amtrak-midwest-test-br2-defconfig O=$PWD -C ../buildroot/

echo "\n\nEnvironment setup in build directory.\n"
echo "To build:"
echo "\tcd build"
echo "\tmake"

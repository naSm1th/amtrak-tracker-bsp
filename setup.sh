#!/bin/bash

(return 0 2>/dev/null) && sourced=1 || sourced=0

mkdir -p dl

make amtrak_midwest_test_defconfig > /dev/null

cd output/amtrak_midwest_test

echo -e "\nEnvironment setup in output/amtrak_midwest_test directory.\n"
echo -e "To build:"
if [ "$sourced" -eq "0" ]; then
    echo -e "\tcd output/amtrak_midwest_test"
fi
echo -e "\tmake"

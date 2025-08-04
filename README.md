# amtrak-tracker-bsp
A Buildroot BSP for the Amtrak tracker board

## Getting started

### Tools
First, setup a standard Buildroot build environment as specified in the [Buildroot manual](https://buildroot.org/downloads/manual/manual.html#requirement).

### Initial environment setup

#### Option 1 (recommended): source helper script

To quickly setup the environment and get building, `source` the `setup.sh` script from the root of the project:
```
source setup.sh
```

#### Option 2: execute helper script

Alternatively, you can execute the `setup.sh` script and then `cd` into the newly-created output directory:
```
./setup.sh
cd output/amtrak_midwest_test
```

#### Option 3: run make

A third option is to manually run `make` instead of relying on the helper script:
```
make amtrak_midwest_test_defconfig
mkdir dl
cd output/amtrak_midwest_test
```

### Build

To build the project, run `make` from the `output/amtrak_midwest_test` directory. The final system image will be located under the `output/amtrak_midwest_test/images/images/` directory and is called `disk.img`. There are many other components of the final image under the `output/amtrak_midwest_test/images/` directory that may be useful.

### Flashing the system image

To flash the above system image onto a board, first put the target board into download mode by holding the boot button down while powering on or resetting the board. Then, use the `sunxi-fel` tool to download the image over USB to the device:
```
sudo sunxi-fel spiflash-write 0 output/amtrak_midwest_test/images/images/disk.img
```

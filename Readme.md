# STM32F103 BluePill Board DFU

STM32F103 BluePill Board Device Firmware Update.


Run this command at terminal

```bash
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/arm-none-eabi.cmake
cmake --build build
```

or 

```bash
chmod +x build.sh
sh build.sh
```

## Board info

- [HDK](https://github.com/WeActStudio/BluePill-Plus)
- **USBD_DFU_APP_DEFAULT_ADD** is set to 0x08005800. This address is the starting address of the upgrade program stored during the upgrade. Use the 0x5800/1024=22KB storage space of 0x08000000~0x08005800 in FLASH to store the DFU program.
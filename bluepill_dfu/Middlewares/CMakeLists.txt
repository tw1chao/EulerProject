cmake_minimum_required(VERSION 3.13)

project(Middlewares)

add_library(${PROJECT_NAME}
STATIC
    ST/STM32_USB_Device_Library/Core/Src/usbd_core.c
    ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c
    ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c
    ST/STM32_USB_Device_Library/Class/DFU/Src/usbd_dfu.c
)

target_compile_definitions(${PROJECT_NAME}
PUBLIC
    USE_HAL_DRIVER
    USE_FULL_LL_DRIVER
    STM32F103xB
)
target_include_directories(${PROJECT_NAME}
PUBLIC
    ST/STM32_USB_Device_Library/Core/Inc/
    ST/STM32_USB_Device_Library/Class/DFU/Inc/
)

target_link_libraries(${PROJECT_NAME}
PRIVATE
    Drivers
    USB_DEVICE
)
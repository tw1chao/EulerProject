cmake_minimum_required(VERSION 3.13)

project(USB_DEVICE)

add_library(${PROJECT_NAME}
STATIC
    App/usb_device.c
    App/usbd_desc.c
    App/usbd_dfu_if.c
    Target/usbd_conf.c
)

target_compile_definitions(${PROJECT_NAME}
PUBLIC
    USE_HAL_DRIVER
    USE_FULL_LL_DRIVER
    STM32F103xB
)
target_include_directories(${PROJECT_NAME}
PUBLIC
    App/
    Target/
)

target_link_libraries(${PROJECT_NAME}
PRIVATE
    Drivers
    Middlewares
)
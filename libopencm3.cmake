set(LIBOPENCM3_PATH "${CMAKE_CURRENT_SOURCE_DIR}/libopencm3")
set(LIBOPENCM3_INCLUDE_PATH "${LIBOPENCM3_PATH}/include")

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/libopencm3-additional/nvic.h DESTINATION ${LIBOPENCM3_INCLUDE_PATH}/libopencm3/stm32/f4)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/libopencm3-additional/vector_nvic.c DESTINATION ${LIBOPENCM3_PATH}/lib/stm32/f4)

set(LIBOPENCM3_SRC
    "${LIBOPENCM3_PATH}/lib/stm32/common/adc_common_v1.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/adc_common_v1_multi.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/adc_common_f47.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/crc_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/crypto_common_f24.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/dac_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/dma_common_f24.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/dma2d_common_f47.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/dsi_common_f47.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/exti_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/flash_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/flash_common_f.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/flash_common_f24.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/flash_common_idcache.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/fmc_common_f47.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/gpio_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/gpio_common_f0234.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/hash_common_f24.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/i2c_common_v1.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/iwdg_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/lptimer_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/ltdc_common_f47.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/pwr_common_v1.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/rcc_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/rng_common_v1.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/rtc_common_l1f024.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/spi_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/spi_common_v1.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/spi_common_v1_frf.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/timer_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/timer_common_f0234.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/timer_common_f24.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/usart_common_all.c"
    "${LIBOPENCM3_PATH}/lib/stm32/common/usart_common_f124.c"
    "${LIBOPENCM3_PATH}/lib/stm32/f4/flash.c"
    "${LIBOPENCM3_PATH}/lib/stm32/f4/pwr.c"
    "${LIBOPENCM3_PATH}/lib/stm32/f4/rcc.c"
    "${LIBOPENCM3_PATH}/lib/stm32/f4/rtc.c"
    "${LIBOPENCM3_PATH}/lib/stm32/f4/crypto.c"
    "${LIBOPENCM3_PATH}/lib/stm32/can.c"
    "${LIBOPENCM3_PATH}/lib/stm32/desig.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb_standard.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb_control.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb_msc.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb_dwc_common.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb_f107.c"
    "${LIBOPENCM3_PATH}/lib/usb/usb_f207.c"
    "${LIBOPENCM3_PATH}/lib/cm3/assert.c"
    "${LIBOPENCM3_PATH}/lib/cm3/dwt.c"
    "${LIBOPENCM3_PATH}/lib/cm3/nvic.c"
    "${LIBOPENCM3_PATH}/lib/cm3/scb.c"
    "${LIBOPENCM3_PATH}/lib/cm3/sync.c"
    "${LIBOPENCM3_PATH}/lib/cm3/systick.c"
    "${LIBOPENCM3_PATH}/lib/cm3/vector.c"
    "${LIBOPENCM3_PATH}/lib/dispatch/vector_chipset.c"
)

add_library(opencm3 STATIC ${LIBOPENCM3_SRC})
target_include_directories(opencm3 PRIVATE ${LIBOPENCM3_INCLUDE_PATH})

set(LIB_OPENCM3 "${CMAKE_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}opencm3${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(INC_OPENCM3 "${LIBOPENCM3_INCLUDE_PATH}")

set(OPENCM3_LD_FILE "${LIBOPENCM3_PATH}/lib/stm32/f4/stm32f405x6.ld")

# TODO: Лучше бы задавать все флаги в основном CMakeLists.txt
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} \
    -L ${LIBOPENCM3_PATH}/lib \
    -nostartfiles")

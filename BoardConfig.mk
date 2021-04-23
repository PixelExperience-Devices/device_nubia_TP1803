
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := nubia

DEVICE_PATH := device/nubia/TP1803

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := TP1803

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_IMAGE_NAME := Image-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_KERNEL_ARCH := arm64
TARGET_PREBUILT_KERNEL := device/tadiphone-fw/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := device/tadiphone-fw/
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOARD_PLATFORM_GPU := qcom-adreno640

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Build
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_DUP_RULES := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# Display
TARGET_USES_HWC2 := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55588106240
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_MKE2FS := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Sepolicy
BOARD_PLAT_PUBLIC_SEPOLICY_DIR := \
    device/qcom/sepolicy/generic/public \
    device/qcom/sepolicy/generic/public/attribute \
    device/qcom/sepolicy/qva/public \
    device/qcom/sepolicy/qva/public/attribute

BOARD_PLAT_PRIVATE_SEPOLICY_DIR := \
    device/qcom/sepolicy/generic/private \
    device/qcom/sepolicy/qva/private

PRODUCT_PUBLIC_SEPOLICY_DIRS := \
    device/qcom/sepolicy/generic/product/public \
    device/qcom/sepolicy/qva/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS := \
    device/qcom/sepolicy/generic/product/private \
    device/qcom/sepolicy/qva/product/private

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH) \
                            vendor/nubia/TP1803

# Treble
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

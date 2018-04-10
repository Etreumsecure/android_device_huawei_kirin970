#
# Copyright (C) 2016 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_SPECIFIC_HEADER_PATH := device/huawei/kirin970/include
TARGET_OTA_ASSERT_DEVICE := kirin970,berkeley

# Board
TARGET_BOOTLOADER_BOARD_NAME := hisi
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform 
TARGET_BOARD_PLATFORM := kirin970
TARGET_CPU_SMP := true
TARGET_USES_64_BIT_BINDER := true
TARGET_USES_HISI_DTIMAGE := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
ANDROID_64 :=true

# 1st Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI := arm64-v8a
TARGET_BOARD_GPU := mali-t830mp2

#2nd Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a15
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5905580032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11231219712
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/kirin970/bluetooth
BOARD_HAVE_BLUETOOTH := true

# Kernel
TARGET_KERNEL_CONFIG := merge_kirin970_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/kirin970
BOARD_KERNEL_CMDLINE := loglevel=4 coherent_pool=512K page_tracker=on slub_min_objects=12 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000
HISI_TARGET_PRODUCT := kirin970
TARGET_ARM_TYPE := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Binder
TARGET_USES_64_BIT_BINDER := true

# linker
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Graphics
HWUI_COMPILE_SYMBOLS := true

# Surfaceflinger
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_HWC2 := true

# NFC
BOARD_NFC_CHIPSET := pn548
TARGET_USES_NQ_NFC := true
NXP_CHIP_TYPE := 2

# OTA
# BLOCK_BASED_OTA := false

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211

# Audio
BOARD_USES_ALSA_AUDIO := true

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := "/sys/class/leds/lcd_backlight0/brightness"
HEALTHD_BACKLIGHT_LEVEL := 102
HEALTHD_FORCE_BACKLIGHT_CONTROL := true

# Recovery
TARGET_RECOVERY_FSTAB := device/huawei/kirin970/rootdir/fstab.kirin970

# lineagehw
#BOARD_HARDWARE_CLASS := device/huawei/kirin970/lineagehw/

# Vold
TARGET_EXFAT_DRIVER := exfat

# build
TARGET_COPY_OUT_VENDOR := system

# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/huawei/kirin970/sepolicy

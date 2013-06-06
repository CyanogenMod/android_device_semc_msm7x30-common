# Copyright (C) 2011 The CyanogenMod Project
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

USE_CAMERA_STUB := true
TARGET_SPECIFIC_HEADER_PATH := device/semc/msm7x30-common/include

TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_USES_2G_VM_SPLIT := true

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_HAVE_TSLIB := true
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# QCOM Hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_NO_HW_VSYNC := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DSEMC_RGBA_8888_OFFSET
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DANCIENT_GL
BOARD_EGL_CFG := device/semc/msm7x30-common/prebuilt/egl.cfg

BOARD_USES_GENERIC_AUDIO := false
BOARD_HAVE_BLUETOOTH := true

# Webkit
TARGET_FORCE_CPU_UPLOAD := true
ENABLE_WEBGL := true

# GPS
BOARD_VENDOR_QCOM_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := semc
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Camera
BOARD_USES_LEGACY_CAMERA := true
TARGET_DISABLE_ARM_PIE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# Recovery
BOARD_CUSTOM_BOOTIMG_MK := device/semc/msm7x30-common/custombootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot;sync;"
BOARD_HAS_SMALL_RECOVERY := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_RECOVERY_CHARGEMODE := false
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/semc/msm7x30-common/recovery/recovery-keys.c
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p1

# Kernel
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x00200000
BOARD_RECOVERY_BASE := 0x00200000

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Light sensor
SOMC_CFG_SENSORS_LIGHT_AS3676 := yes
SOMC_CFG_SENSORS_LIGHT_AS3676_PATH := "/sys/devices/i2c-0/0-0040/adc_als_value"
SOMC_CFG_SENSORS_LIGHT_AS3676_MAXRANGE := 13000

# A custom ota package maker for a device without an exposed boot partition
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/semc/msm7x30-common/releasetools/semc_ota_from_target_files

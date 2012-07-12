#
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
#

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/msm7x30-common/overlay

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_MANUFACTURER := Sony

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_COPY_FILES += \
    device/semc/msm7x30-common/prebuilt/fillers:root/fillers \
    device/semc/msm7x30-common/prebuilt/10hostapconf:system/etc/init.d/10hostapconf \
    device/semc/msm7x30-common/prebuilt/ueventd.semc.rc:root/ueventd.semc.rc \
    device/semc/msm7x30-common/prebuilt/gps.conf:system/etc/gps.conf \
    device/semc/msm7x30-common/prebuilt/fstab:root/fstab \
    device/semc/msm7x30-common/prebuilt/bootrec:root/sbin/bootrec \
    device/semc/msm7x30-common/prebuilt/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh


#recovery resources
PRODUCT_COPY_FILES += \
    bootable/recovery/res/images/icon_firmware_error.png:root/res/images/icon_firmware_error.png \
    bootable/recovery/res/images/icon_firmware_install.png:root/res/images/icon_firmware_install.png \
    bootable/recovery/res/images/icon_clockwork.png:root/res/images/icon_clockwork.png \
    bootable/recovery/res/images/icon_error.png:root/res/images/icon_error.png \
    bootable/recovery/res/images/icon_installing.png:root/res/images/icon_installing.png \
    bootable/recovery/res/images/icon_installing_overlay01.png:root/res/images/icon_installing_overlay01.png \
    bootable/recovery/res/images/icon_installing_overlay02.png:root/res/images/icon_installing_overlay02.png \
    bootable/recovery/res/images/icon_installing_overlay03.png:root/res/images/icon_installing_overlay03.png \
    bootable/recovery/res/images/icon_installing_overlay04.png:root/res/images/icon_installing_overlay04.png \
    bootable/recovery/res/images/icon_installing_overlay05.png:root/res/images/icon_installing_overlay05.png \
    bootable/recovery/res/images/icon_installing_overlay06.png:root/res/images/icon_installing_overlay06.png \
    bootable/recovery/res/images/icon_installing_overlay07.png:root/res/images/icon_installing_overlay07.png \
    bootable/recovery/res/images/indeterminate01.png:root/res/images/indeterminate01.png \
    bootable/recovery/res/images/indeterminate02.png:root/res/images/indeterminate02.png \
    bootable/recovery/res/images/indeterminate03.png:root/res/images/indeterminate03.png \
    bootable/recovery/res/images/indeterminate04.png:root/res/images/indeterminate04.png \
    bootable/recovery/res/images/indeterminate05.png:root/res/images/indeterminate05.png \
    bootable/recovery/res/images/indeterminate06.png:root/res/images/indeterminate06.png \
    bootable/recovery/res/images/progress_empty.png:root/res/images/progress_empty.png \
    bootable/recovery/res/images/progress_fill.png:root/res/images/progress_fill.png

#Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x30 \
    audio_policy.msm7x30 \
    libaudioutils

#Gralloc
PRODUCT_PACKAGES += \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libQcomUI \
    libtilerenderer \
    libmemalloc \
    liboverlay

#Hal
PRODUCT_PACKAGES += \
    gps.semc \
    lights.semc \
    camera.semc \
    sensors.semc

# QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libmm-omxcore \
    libdivxdrmdecrypt

#Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.tethering.kb_disconnect=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.ril.def.agps.mode=2 \
    ro.ril.def.agps.feature=1 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.ril_class=SemcRIL \
    wifi.supplicant_scan_interval=15 \
    keyguard.no_require_sim=true \
    ro.com.google.locationfeatures=1 \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    persist.ro.ril.sms_sync_sending=1 \
    ro.use_data_netmgrd=true \
    debug.sf.hw=1 \
    debug.composition.type=dyn \
    ro.sf.compbypass.enable=1 \
    dev.pm.dyn_samplingrate=1 \
    com.qc.hardware=true \
    BUILD_UTC_DATE=0 \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    persist.sys.usb.config=mass_storage \
    debug.camcorder.disablemeta=1


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
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_COPY_FILES += \
    device/semc/msm7x30-common/prebuilt/gps.conf:system/etc/gps.conf \
    device/semc/msm7x30-common/prebuilt/recovery.fstab:root/recovery.fstab \
    device/semc/msm7x30-common/prebuilt/filler:root/filler \
    device/semc/msm7x30-common/prebuilt/10dnsconf:system/etc/init.d/10dnsconf \
    device/semc/msm7x30-common/prebuilt/10hostapconf:system/etc/init.d/10hostapconf \
    device/semc/msm7x30-common/prebuilt/10cpmodules:system/etc/init.d/10cpmodules \
    device/semc/msm7x30-common/prebuilt/dnsmasq.conf:system/etc/wifi/dnsmasq.conf

PRODUCT_PACKAGES += \
hostap\
    librs_jni \
    gralloc.msm7x30 \
    overlay.default \
    screencap \
    gps.semc \
    lights.semc \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.ril_class=semc

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

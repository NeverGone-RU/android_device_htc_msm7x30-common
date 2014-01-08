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

# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += \
    device/htc/msm7x30-common/rootdir/init.htc7x30.usb.rc:root/init.htc7x30.usb.rc \
    device/htc/msm7x30-common/rootdir/fstab.msm7x30:root/fstab.msm7x30 \
    device/htc/msm7x30-common/rootdir/fstab.msm7x30:recovery/root/fstab.msm7x30

# media configs
PRODUCT_COPY_FILES += \
    device/htc/msm7x30-common/rootdir/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/msm7x30-common/rootdir/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/msm7x30-common/rootdir/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_COPY_FILES += \
    device/htc/msm7x30-common/prebuilt/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so

PRODUCT_PACKAGE_OVERLAYS += device/htc/msm7x30-common/overlay

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x30 \
    audio.usb.default \
    libaudioutils \
    libtinyalsa

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer \
    libdashplayer

#wireless
PRODUCT_PACKAGES += \
    libnetcmdiface

# Power HAL & GPS
PRODUCT_PACKAGES += \
    gps.msm7x30 \
    power.msm7x30

# Media
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libstagefrighthw

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Misc Packages
PRODUCT_PACKAGES += \
    Torch

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# lower the increment
ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.heapgrowthlimit=36m

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.composition.type=gpu \
    debug.sf.hw=1 \
    debug.egl.hw=1

$(call inherit-product-if-exists, vendor/htc/msm7x30-common/msm7x30-common-vendor.mk)

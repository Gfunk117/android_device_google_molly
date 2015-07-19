#
# Copyright (C) 2014 The CyanogenMod Project
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

PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# xhdpi, while we are hardcoding the 1080 resolution.
# when we start doing 720 as well, will need to stop hardcoding this.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Bootanimation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_CHARACTERISTICS := tv,nosdcard

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/google/molly/overlay

# Enable frame-exact AV sync
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync=true

# Hdmi CEC: molly works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# Misc stock props
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    media.stagefright.cache-params=10240/20480/15 \
    media.aac_51_output_enabled=true \
    dalvik.vm.implicit_checks=none \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216 \
    ro.vold.wipe_on_crypt_fail=1

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
     persist.sys.usb.config=mtp

# AppDrawer
PRODUCT_PACKAGES += \
    AppDrawer

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayouts/ADT-1_Remote.kl:system/usr/keylayout/ADT-1_Remote.kl \
    $(LOCAL_PATH)/keylayouts/gpio-keypad.kl:system/usr/keylayout/gpio-keypad.kl \
    $(LOCAL_PATH)/keylayouts/Spike.kl:system/usr/keylayout/Spike.kl \
    $(LOCAL_PATH)/keylayouts/virtual-remote.kl:system/usr/keylayout/virtual-remote.kl \
    $(LOCAL_PATH)/keylayouts/gpio-keypad.idc:system/usr/idc/gpio-keypad.idc \
    $(LOCAL_PATH)/keylayouts/virtual-remote.idc:system/usr/idc/virtual-remote.idc \
    $(LOCAL_PATH)/keylayouts/gpio-keypad.kcm:system/usr/keychars/gpio-keypad.kcm \
    $(LOCAL_PATH)/keylayouts/virtual-remote.kcm:system/usr/keychars/virtual-remote.kcm \
    $(LOCAL_PATH)/keylayouts/Nexus_Remote.kl:system/usr/keylayout/Nexus_Remote.kl \
    $(LOCAL_PATH)/keylayouts/Vendor_2836_Product_0001.kl:system/usr/keylayout/Vendor_2836_Product_0001.kl \
    $(LOCAL_PATH)/keylayouts/Vendor_20a0_Product_0001.kl:system/usr/keylayout/Vendor_20a0_Product_0001.kl

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/permissions/android.hardware.type.television.xml:system/etc/permissions/android.hardware.type.television.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/molly_core_hardware.xml:system/etc/permissions/molly_core_hardware.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.molly \
    init.molly.rc \
    init.molly.usb.rc \
    ueventd.molly.rc

# TV parts
PRODUCT_PACKAGES += \
    TvProvider \
    TvSettings \
    tv_input.default

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    libwpa_client \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, vendor/google/molly/molly-vendor.mk)

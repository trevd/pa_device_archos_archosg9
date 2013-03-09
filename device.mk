#
# Copyright (C) 2011 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/archos/archos_g9/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

include frameworks/native/build/tablet-dalvik-heap.mk
include device/archos/archos_g9/usb_modeswitch.mk

### Root copy files
PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel \
    $(PREBUILT_PATH)/root/init:root/init \
    $(PREBUILT_PATH)/root/init.archos_init.rc:root/init.archos_init.rc \
    $(PREBUILT_PATH)/root/init.archosa80sboard.rc:root/init.archosa80sboard.rc \
    $(PREBUILT_PATH)/root/init.dongle.rc:root/init.dongle.rc \
    $(PREBUILT_PATH)/root/init.goldfish.rc:root/init.goldfish.rc \
    $(PREBUILT_PATH)/root/init.rc:root/init.rc \
    $(PREBUILT_PATH)/root/ueventd.archos.rc:root/ueventd.archos.rc \
    $(PREBUILT_PATH)/root/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(PREBUILT_PATH)/root/ueventd.rc:root/ueventd.rc

### System copy files
# apns
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Audio
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/lib/libtinyalsa.so:system/lib/libtinyalsa.so

# Binaries
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/bin/hotplugd:system/bin/hotplugd \
    $(PREBUILT_PATH)/system/xbin/chat:system/xbin/chat \
    $(PREBUILT_PATH)/system/bin/rild:system/bin/rild \
    $(PREBUILT_PATH)/system/lib/libhuaweigeneric-ril.so:system/lib/libhuaweigeneric-ril.so \
    $(PREBUILT_PATH)/system/lib/libtcl-ril.so:system/lib/libtcl-ril.so                 \
    $(PREBUILT_PATH)/system/lib/libusb.so:system/lib/libusb.so

# Chat
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/chatscripts/gprs_start:system/etc/chatscripts/gprs_start \
    $(PREBUILT_PATH)/system/etc/chatscripts/gprs_stop:system/etc/chatscripts/gprs_stop \
    $(PREBUILT_PATH)/system/etc/chatscripts/datakey_start:system/etc/chatscripts/datakey_start \
    $(PREBUILT_PATH)/system/etc/chatscripts/datakey_stop:system/etc/chatscripts/datakey_stop 

# DRM
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    $(PREBUILT_PATH)/system/vendor/lib/libwvdrm_L3.so:system/vendor/lib/libwvdrm_L3.so \
    $(PREBUILT_PATH)/system/vendor/lib/libWVStreamControlAPI_L3.so:system/vendor/lib/libWVStreamControlAPI_L3.so \

# GPS
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/lib/libgpsservices.so:system/lib/libgpsservices.so \
    $(PREBUILT_PATH)/system/lib/libmcphalgps.so:system/lib/libmcphalgps.so \
    $(PREBUILT_PATH)/system/lib/libsupllocationprovider.so:system/lib/libsupllocationprovider.so \
    $(PREBUILT_PATH)/system/lib/libsuplhelperservicejni.so:system/lib/libsuplhelperservicejni.so \
    $(PREBUILT_PATH)/system/lib/libgps.so:system/lib/libgps.so

# HW
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/lib/hw/camera.archos.so:system/lib/hw/camera.archos.so \
    $(PREBUILT_PATH)/system/lib/hw/gps.archos.so:system/lib/hw/gps.archos.so \
    $(PREBUILT_PATH)/system/lib/hw/lights.archos.so:system/lib/hw/lights.archos.so

# Misc
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/gps/cert/client_keystore.bks:system/etc/gps/cert/client_keystore.bks \
    $(PREBUILT_PATH)/system/etc/gps/config/GPSCConfigFile.cfg:system/etc/gps/config/GPSCConfigFile.cfg \
    $(PREBUILT_PATH)/system/etc/gps/config/GpsConfigFile.txt:system/etc/gps/config/GpsConfigFile.txt \
    $(PREBUILT_PATH)/system/etc/gps/config/inavconfigfile.txt:system/etc/gps/config/inavconfigfile.txt \
    $(PREBUILT_PATH)/system/etc/gps/config/pathconfigfile.txt:system/etc/gps/config/pathconfigfile.txt \
    $(PREBUILT_PATH)/system/etc/gps/config/PeriodicConfFile.cfg:system/etc/gps/config/PeriodicConfFile.cfg \
    $(PREBUILT_PATH)/system/etc/gps/config/SuplConfig.spl:system/etc/gps/config/SuplConfig.spl \
    $(PREBUILT_PATH)/system/etc/gps/patch/patch-X.0.ce:system/etc/gps/patch/patch-X.0.ce
   
# Modem Kernel Modules
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/root/lib/modules/usb_wwan.ko:root/lib/modules/usb_wwan.ko \
    $(PREBUILT_PATH)/root/lib/modules/option.ko:root/lib/modules/option.ko \
    $(PREBUILT_PATH)/root/lib/modules/hso.ko:root/lib/modules/hso.ko 

# OMX
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/firmware/ducati-m3.bin:system/etc/firmware/ducati-m3.bin

# Permissions
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(PREBUILT_PATH)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# pppd
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/ppp/init_pppd_gprs:system/etc/ppp/init_pppd_gprs \
    $(PREBUILT_PATH)/system/etc/ppp/init_pppd_datakey:system/etc/ppp/init_pppd_datakey \
    $(PREBUILT_PATH)/system/etc/ppp/ip-up-datakey:system/etc/ppp/ip-up-datakey \
    $(PREBUILT_PATH)/system/etc/ppp/ip-up-gprs:system/etc/ppp/ip-up-gprs \
    $(PREBUILT_PATH)/system/etc/ppp/ip-down-datakey:system/etc/ppp/ip-down-datakey \
    $(PREBUILT_PATH)/system/etc/ppp/ip-down-gprs:system/etc/ppp/ip-down-gprs \
    $(PREBUILT_PATH)/system/etc/ppp/peers/datakey:system/etc/ppp/peers/datakey \
    $(PREBUILT_PATH)/system/etc/ppp/peers/gprs:system/etc/ppp/peers/gprs \
    $(PREBUILT_PATH)/system/etc/ppp/write_secrets:system/etc/ppp/write_secrets 

# Screen
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/usr/idc/cpt_i2c_tsp.idc:system/usr/idc/cpt_i2c_tsp.idc \
    $(PREBUILT_PATH)/system/usr/idc/cypress-tma340.idc:system/usr/idc/cypress-tma340.idc \
    $(PREBUILT_PATH)/system/usr/idc/pixcir_i2c_tsp.idc:system/usr/idc/pixcir_i2c_tsp.idc \
    $(PREBUILT_PATH)/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    $(PREBUILT_PATH)/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    $(PREBUILT_PATH)/system/usr/idc/tr16c0_i2c_tsp.idc:system/usr/idc/tr16c0_i2c_tsp.idc

# Vold
PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/fstab:system/etc/fstab \
    $(PREBUILT_PATH)/system/etc/fstab_nand:system/etc/fstab_nand \
    $(PREBUILT_PATH)/system/etc/fstab_nor:system/etc/fstab_nor \
    $(PREBUILT_PATH)/system/etc/vold.A80H.fstab:system/etc/vold.A80H.fstab \
    $(PREBUILT_PATH)/system/etc/vold.A80S.fstab:system/etc/vold.A80S.fstab \
    $(PREBUILT_PATH)/system/etc/vold.A101H.fstab:system/etc/vold.A101H.fstab \
    $(PREBUILT_PATH)/system/etc/vold.A101S.fstab:system/etc/vold.A101S.fstab \
    $(PREBUILT_PATH)/system/etc/vold.fstab:system/etc/vold.fstab

### Product packages
# Audio Support
PRODUCT_PACKAGES += \
    libaudioutils \
    tinyplay \
    tinymix \
    tinycap \
    audio_policy.default \
    audio.usb.default

# BlueZ
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    hciconfig \
    hcitool

# DRM
PRODUCT_PACKAGES += \
    libwvm

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    sdcard \
    setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    libinvensense_mpl \
    libnetcmdiface \
    parse_hdmi_edid \
    libedid

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    wpa_supplicant.conf \
    crda \
    regulatory.bin \
    calibrator

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    hwui.render_dirty_regions=false \
    persist.sys.root_access=3 \
    ro.sf.lcd_density=160

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := \
    device/archos/archos_g9/overlay

$(call inherit-product-if-exists, device/archos/archos_g9/imgtec/sgx-imgtec-bins-540.mk)

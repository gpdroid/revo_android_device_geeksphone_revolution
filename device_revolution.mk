$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/geeksphone/revolution/revolution-vendor.mk)

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# device specific overlay folder
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/revolution_overlays

LOCAL_PATH := device/geeksphone/revolution
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/boot.img:boot_signed.img \
    $(LOCAL_PATH)/recovery.img:recovery_revolution.img \
    $(LOCAL_PATH)/tools/adb:adb \
    $(LOCAL_PATH)/tools/fastboot:fastboot \
    $(LOCAL_PATH)/tools/flash.sh:flash.sh 

#Files needed fot boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.watchdog.rc:root/init.watchdog.rc \
    $(LOCAL_PATH)/init/charger:root/charger \
    $(LOCAL_PATH)/init/default.prop:root/default.prop \
    $(LOCAL_PATH)/init/fstab.charger.revolution:root/fstab.charger.revolution \
    $(LOCAL_PATH)/init/fstab.revolution:root/fstab.revolution \
    $(LOCAL_PATH)/init/ia_watchdogd:root/usr/bin/ia_watchdogd \
    $(LOCAL_PATH)/init/init.avc.rc:root/init.avc.rc \
    $(LOCAL_PATH)/init/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/init/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/init/init.bt.vendor.rc:root/init.bt.vendor.rc \
    $(LOCAL_PATH)/init/init.common.rc:root/init.common.rc \
    $(LOCAL_PATH)/init/init.gps.io.rc:root/init.gps.io.rc \
    $(LOCAL_PATH)/init/init.gps.rc:root/init.gps.rc \
    $(LOCAL_PATH)/init/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/init/init.platform.usb.rc:root/init.platform.usb.rc \
    $(LOCAL_PATH)/init/init.rc:root/init.rc \
    $(LOCAL_PATH)/init/init.revolution.rc:root/init.revolution.rc \
    $(LOCAL_PATH)/init/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/init/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/init/init.widi.rc:root/init.widi.rc \
    $(LOCAL_PATH)/init/init.widi.vendor.rc:root/init.widi.vendor.rc \
    $(LOCAL_PATH)/init/init.wifi.rc:root/init.wifi.rc \
    $(LOCAL_PATH)/init/init.wifi.vendor.rc:root/init.wifi.vendor.rc \
    $(LOCAL_PATH)/init/init.wireless.rc:root/init.wireless.rc \
    $(LOCAL_PATH)/init/props.board.rc:root/props.board.rc \
    $(LOCAL_PATH)/init/props.default.rc:root/props.default.rc \
    $(LOCAL_PATH)/init/props.platform.rc:root/props.platform.rc \
    $(LOCAL_PATH)/init/props.rc:root/props.rc \
    $(LOCAL_PATH)/init/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/init/ueventd.revolution.rc:root/ueventd.revolution.rc 

# Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/atomisp.ko:root/lib/modules/atomisp.ko \
    $(LOCAL_PATH)/modules/bcm4330.ko:root/lib/modules/bcm4330.ko \
    $(LOCAL_PATH)/modules/bcm_bt_lpm.ko:root/lib/modules/bcm_bt_lpm.ko \
    $(LOCAL_PATH)/modules/cfg80211.ko:root/lib/modules/cfg80211.ko \
    $(LOCAL_PATH)/modules/imx1x5.ko:root/lib/modules/imx1x5.ko \
    $(LOCAL_PATH)/modules/mac80211.ko:root/lib/modules/mac80211.ko \
    $(LOCAL_PATH)/modules/modules.alias:root/lib/modules/modules.alias \
    $(LOCAL_PATH)/modules/modules.alias.bin:root/lib/modules/modules.alias.bin \
    $(LOCAL_PATH)/modules/modules.builtin.bin:root/lib/modules/modules.builtin.bin \
    $(LOCAL_PATH)/modules/modules.dep:root/lib/modules/modules.dep \
    $(LOCAL_PATH)/modules/modules.dep.bin:root/lib/modules/modules.dep.bin \
    $(LOCAL_PATH)/modules/modules.devname:root/lib/modules/modules.devname \
    $(LOCAL_PATH)/modules/modules.softdep:root/lib/modules/modules.softdep \
    $(LOCAL_PATH)/modules/modules.symbols:root/lib/modules/modules.symbols \
    $(LOCAL_PATH)/modules/modules.symbols.bin:root/lib/modules/modules.symbols.bin \
    $(LOCAL_PATH)/modules/pax.ko:root/lib/modules/pax.ko:root \
    $(LOCAL_PATH)/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/modules/sep3_10.ko:root/lib/modules/sep3_10.ko \
    $(LOCAL_PATH)/modules/sgx.ko:root/lib/modules/sgx.ko \
    $(LOCAL_PATH)/modules/videobuf-core.ko:root/lib/modules/videobuf-core.ko \
    $(LOCAL_PATH)/modules/videobuf-vmalloc.ko:root/lib/modules/videobuf-vmalloc.ko \
    $(LOCAL_PATH)/modules/vtsspp.ko:root/lib/modules/vtsspp.ko
    
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Enable it if you have glitches on 2D rendering
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1

# Enable location
PRODUCT_PACKAGES := NetworkLocation

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# Don't preload EGL drivers in Zygote at boot time
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

#wifi
PRODUCT_PACKAGES += \
    wifi_bcm_4330

#A2dp
PRODUCT_PACKAGES += \
    audio.a2dp.default

#bluetooth
PRODUCT_PACKAGES += \
    bt_bcm

# Broadcom GPS
PRODUCT_PACKAGES += \
   gps_bcm_4752

# Houdini
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,$(LOCAL_PATH)/houdini/system,system)

PRODUCT_PACKAGES += \
   libhoudini_hook \
   houdini_hook

# PowerHal lib
PRODUCT_PACKAGES += \
   power.revolution

#Updater
PRODUCT_PACKAGES += \
   Updater

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sf.lcd_density=240 \
    panel.physicalWidthmm=57.996 \
    panel.physicalHeightmm=103.104 \
    gsm.net.interface=rmnet0 \
    persist.system.at-proxy.mode=0 \
    persist.ril-daemon.disable=0 \
    persist.radio.ril_modem_state=1  

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_revolution
PRODUCT_DEVICE := revolution

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/armani/armani-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/armani/overlay

LOCAL_PATH := device/xiaomi/armani
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)


# Ramdisk files
PRODUCT_COPY_FILES += \
    device/xiaomi/armani/ramdisk/fstab.qcom:root/fstab.qcom \
    device/xiaomi/armani/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/xiaomi/armani/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/xiaomi/armani/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/xiaomi/armani/ramdisk/init.qcom.factory.sh:root/init.qcom.factory.sh \
    device/xiaomi/armani/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/xiaomi/armani/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/xiaomi/armani/ramdisk/init.qcom.ril.sh:root/init.qcom.ril.sh \
    device/xiaomi/armani/ramdisk/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    device/xiaomi/armani/ramdisk/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/xiaomi/armani/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/xiaomi/armani/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/xiaomi/armani/ramdisk/init.target.rc:root/init.target.rc \
    device/xiaomi/armani/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/xiaomi/armani/ramdisk/sbin/chargeonlymode:root/sbin/chargeonlymode \
    device/xiaomi/armani/ramdisk/default.prop:root/default.prop \
    device/xiaomi/armani/ramdisk/file_contexts:root/file_contexts \
    device/xiaomi/armani/ramdisk/property_contexts:root/property_contexts \
    device/xiaomi/armani/ramdisk/seapp_contexts:root/seapp_contexts \
    device/xiaomi/armani/ramdisk/sepolicy:root/sepolicy 

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_armani
PRODUCT_DEVICE := armani

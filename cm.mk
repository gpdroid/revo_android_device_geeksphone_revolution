## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := revolution

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/geeksphone/revolution/device_revolution.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := revolution
PRODUCT_NAME := cm_revolution
PRODUCT_BRAND := geeksphone
PRODUCT_MODEL := revolution
PRODUCT_MANUFACTURER := geeksphone

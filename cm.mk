# Inherit device configuration for molly.
$(call inherit-product, device/google/molly/full_molly.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

PRODUCT_NAME := cm_molly

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=molly \
    TARGET_DEVICE=molly \
    BUILD_FINGERPRINT="google/molly/molly:5.0.2/LRX22G/1649326:user/release-keys" \
    PRIVATE_BUILD_DESC="molly-user 5.0.2 LRX22G 1649326 release-keys"


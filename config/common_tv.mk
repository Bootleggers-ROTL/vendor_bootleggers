# Inherit common Bootleggers stuff
$(call inherit-product, vendor/bootleggers/config/common.mk)

# Include AOSP audio files
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioTv.mk)

# Inherit Bootleggers atv device tree
$(call inherit-product, device/bootleggers/atv/bootleggers_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Bootleggers packages
PRODUCT_PACKAGES += \
    Catapult \
    BootleggersCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/bootleggers/overlay/tv

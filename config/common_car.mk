# Inherit common Bootleggers stuff
$(call inherit-product, vendor/bootleggers/config/common.mk)

# Inherit Bootleggers car device tree
$(call inherit-product, device/bootleggers/car/bootleg_car.mk)

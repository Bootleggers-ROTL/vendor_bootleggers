# Set Bootleggers specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Bootleggers stuff
$(call inherit-product, vendor/bootleggers/config/common_full_phone.mk)

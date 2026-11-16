# Set Bootleggers specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Bootleggers stuff
$(call inherit-product, vendor/bootleggers/config/common_mini_phone.mk)

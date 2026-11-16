# Inherit mobile full common Bootleggers stuff
$(call inherit-product, vendor/bootleggers/config/common_mobile_full.mk)

# Inherit tablet common Bootleggers stuff
$(call inherit-product, vendor/bootleggers/config/tablet.mk)

$(call inherit-product, vendor/bootleggers/config/telephony.mk)

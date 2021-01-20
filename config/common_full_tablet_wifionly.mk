# Inherit full common Lineage stuff
$(call inherit-product, vendor/lighthouse/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/lighthouse/overlay/dictionaries

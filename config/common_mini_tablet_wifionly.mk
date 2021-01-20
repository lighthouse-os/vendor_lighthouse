# Inherit mini common Lineage stuff
$(call inherit-product, vendor/lighthouse/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

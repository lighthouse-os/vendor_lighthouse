# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/lighthouse/config/common.mk)

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator \

# Lineage packages
PRODUCT_PACKAGES += \
    Seedvault

# Customizations
PRODUCT_PACKAGES += \
    IconShapeSquareOverlay \
    NavigationBarMode2ButtonOverlay

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

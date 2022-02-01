LIGHTHOUSE_OTA_VERSION_CODE := sailboat

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.lighthouse.ota.version_code=$(LIGHTHOUSE_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

ifeq ($(LIGHTHOUSE_BUILD_TYPE), OFFICIAL)

LIGHTHOUSE_OTA_VERSION_CODE := raft

PRODUCT_GENERIC_PROPERTIES += \
    ro.lighthouse.ota.version_code=$(LIGHTHOUSE_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

endif

ifneq ($(wildcard vendor/lighthouse/prebuilt/common/bootanimation/$(scr_resolution).zip),)
PRODUCT_COPY_FILES += \
    vendor/lighthouse/prebuilt/common/bootanimation/$(scr_resolution).zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

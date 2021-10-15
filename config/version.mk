# Versioning System
LIGHTHOUSE_BUILD_VERSION =Sailboat
LIGHTHOUSE_BUILD_TYPE ?= UNOFFICIAL
LIGHTHOUSE_VARIANT ?= VANILLA
LIGHTHOUSE_BUILD_MAINTAINER ?= Spam Dev Moment.
LIGHTHOUSE_BUILD_DONATE_URL ?= https://www.paypal.me/dartdental
LIGHTHOUSE_BUILD_SUPPORT_URL ?= https://t.me/LIGHTHOUSEOS_chat

ifeq ($(LIGHTHOUSE_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat device/official/lighthouse.devices)
  FOUND_DEVICE =  $(filter $(LIGHTHOUSE_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(LIGHTHOUSE_BUILD))
      LIGHTHOUSE_BUILD_TYPE := OFFICIAL
    else
      LIGHTHOUSE_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(LIGHTHOUSE_BUILD)")
    endif
endif

# Gapps
ifeq ($(WITH_GAPPS),true)
$(call inherit-product, vendor/gms/gms_full.mk)
LIGHTHOUSE_VARIANT := GAPPS

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/lighthouse/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/lighthouse/overlay-gapps

$(call inherit-product, vendor/lighthouse/config/rro_overlays.mk)
endif

# System version
TARGET_PRODUCT_SHORT := $(subst lighthouse_,,$(LIGHTHOUSE_BUILD_TYPE))

LIGHTHOUSE_DATE_YEAR := $(shell date -u +%Y)
LIGHTHOUSE_DATE_MONTH := $(shell date -u +%m)
LIGHTHOUSE_DATE_DAY := $(shell date -u +%d)
LIGHTHOUSE_DATE_HOUR := $(shell date -u +%H)
LIGHTHOUSE_DATE_MINUTE := $(shell date -u +%M)


LIGHTHOUSE_BUILD_DATE := $(LIGHTHOUSE_DATE_YEAR)$(LIGHTHOUSE_DATE_MONTH)$(LIGHTHOUSE_DATE_DAY)-$(LIGHTHOUSE_DATE_HOUR)$(LIGHTHOUSE_DATE_MINUTE)
LIGHTHOUSE_BUILD_FINGERPRINT := LighthouseOS/$(LIGHTHOUSE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(LIGHTHOUSE_BUILD_DATE)
LIGHTHOUSE_VERSION := LighthouseOS-$(LIGHTHOUSE_BUILD_VERSION)-$(LIGHTHOUSE_BUILD_TYPE)-$(LIGHTHOUSE_BUILD)-$(LIGHTHOUSE_BUILD_DATE)-$(LIGHTHOUSE_VARIANT)

PRODUCT_GENERIC_PROPERTIES += \
  ro.lighthouse.device=$(LIGHTHOUSE_BUILD) \
  ro.lighthouse.version=$(LIGHTHOUSE_VERSION) \
  ro.lighthouse.build.version=$(LIGHTHOUSE_BUILD_VERSION) \
  ro.lighthouse.build.type=$(LIGHTHOUSE_BUILD_TYPE) \
  ro.lighthouse.build.variant=$(LIGHTHOUSE_VARIANT) \
  ro.lighthouse.build.date=$(LIGHTHOUSE_BUILD_DATE) \
  ro.lighthouse.build.fingerprint=$(LIGHTHOUSE_BUILD_FINGERPRINT) \
  ro.lighthouse.build.maintainer=$(LIGHTHOUSE_BUILD_MAINTAINER) \
  ro.lighthouse.build.donate_url=$(LIGHTHOUSE_BUILD_DONATE_URL) \
  ro.lighthouse.build.support_url=$(LIGHTHOUSE_BUILD_SUPPORT_URL)

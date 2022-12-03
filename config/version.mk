# Copyright (C) 2020 Lighthouse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
BUILD_DATE := $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(subst lighthouse_,,$(LIGHTHOUSE_BUILD))

LIGHTHOUSE_BUILDTYPE ?= HOMEMADE
LIGHTHOUSE_BUILD_VERSION := $(PLATFORM_VERSION)
LIGHTHOUSE_VERSION := $(LIGHTHOUSE_BUILD_VERSION)-$(LIGHTHOUSE_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(BUILD_DATE)
ROM_FINGERPRINT := Lighthouse/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.lighthouse.build.version=$(LIGHTHOUSE_BUILD_VERSION) \
  ro.lighthouse.build.date=$(BUILD_DATE) \
  ro.lighthouse.buildtype=$(LIGHTHOUSE_BUILDTYPE) \
  ro.lighthouse.fingerprint=$(ROM_FINGERPRINT) \
  ro.lighthouse.version=$(LIGHTHOUSE_VERSION) \
  ro.lighthouse.device=$(LIGHTHOUSE_BUILD) \
  ro.modversion=$(LIGHTHOUSE_VERSION)

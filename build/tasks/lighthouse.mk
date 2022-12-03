LIGHTHOUSE_TARGET_PACKAGE := $(PRODUCT_OUT)/Lighthouse-$(LIGHTHOUSE_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: otapackage lighthouse bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
lighthouse: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(LIGHTHOUSE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(LIGHTHOUSE_TARGET_PACKAGE) | cut -d ' ' -f1 > $(LIGHTHOUSE_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/lighthouse/tools/generate_json_build_info.sh $(LIGHTHOUSE_TARGET_PACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}Lighthouse${txtrst}";
	@echo -e "		Project Lighthouse	   "
	@echo -e ""
	@echo -e "zip: "$(LIGHTHOUSE_TARGET_PACKAGE)
	@echo -e "sha256: "${cya}" `cat $(LIGHTHOUSE_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(LIGHTHOUSE_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: lighthouse

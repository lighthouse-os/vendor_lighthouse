LIGHTHOUSE_FASTBOOT_PACKAGE := $(PRODUCT_OUT)/Lighthouse-$(LIGHTHOUSE_VERSION)-img.zip

.PHONY: updatepackage lighthouse-fastboot
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
lighthouse-fastboot: updatepackage
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(LIGHTHOUSE_FASTBOOT_PACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}Lighthouse${txtrst}";
	@echo -e "		Project Lighthouse	   "
	@echo -e ""
	@echo -e "zip: "$(LIGHTHOUSE_FASTBOOT_PACKAGE)
	@echo -e "size:`ls -lah $(LIGHTHOUSE_FASTBOOT_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

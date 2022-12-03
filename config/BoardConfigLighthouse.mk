include vendor/lighthouse/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/lighthouse/config/BoardConfigQcom.mk
endif

include vendor/lighthouse/config/BoardConfigSoong.mk

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append:bcm-2xxx-rpi4 = " \
	file://0001-config-add-BSP-specific-configuration-in-config.txt.patch \
"

VC4DTBO:bcm-2xxx-rpi4 ?= "vc4-fkms-v3d"
ENABLE_UART:bcm-2xxx-rpi4 ?= "1"


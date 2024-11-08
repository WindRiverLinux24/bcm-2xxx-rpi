#
# Copyright (C) 2019 Wind River Systems, Inc.
#

TARGET_SUPPORTED_KTYPES:rpi = "standard preempt-rt"
COMPATIBLE_MACHINE:rpi = "bcm-2xxx-rpi4"

inherit siteinfo
KERNEL_DTC_FLAGS:append:rpi = " -@ -H epapr"

SRC_URI:append:rpi = " file://0001-brcmfmac-Fix-implicit-declaration-build-error.patch"

FILESEXTRAPATHS:prepend:rpi := "${THISDIR}/linux-yocto:"

#
# Copyright (C) 2019 Wind River Systems, Inc.
#

TARGET_SUPPORTED_KTYPES:rpi = "standard"
COMPATIBLE_MACHINE:rpi = "bcm-2xxx-rpi4"

inherit siteinfo
KERNEL_DTC_FLAGS:append:rpi = " -@ -H epapr"

KERNEL_VERSION_SANITY_SKIP = "1"
SRCREV_machine:rpi ?= "${AUTOREV}"
SRCREV_meta:rpi ?= "${AUTOREV}"

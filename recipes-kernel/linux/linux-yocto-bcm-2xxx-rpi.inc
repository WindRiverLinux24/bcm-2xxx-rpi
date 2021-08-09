#
# Copyright (C) 2019 Wind River Systems, Inc.
#

TARGET_SUPPORTED_KTYPES:rpi = "standard"
COMPATIBLE_MACHINE:rpi = "bcm-2xxx-rpi4"

inherit kernel siteinfo
KERNEL_EXTRA_ARGS:append:rpi = " DTC_FLAGS='-@ -H epapr'"
do_compile:append:rpi() {
    if [ "${SITEINFO_BITS}" = "64" ]; then
        cc_extra=$(get_cc_option)
        oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
    fi
}

KERNEL_VERSION_SANITY_SKIP = "1"
SRCREV_machine:rpi ?= "${AUTOREV}"
SRCREV_meta:rpi ?= "${AUTOREV}"

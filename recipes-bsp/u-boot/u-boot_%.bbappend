FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DEPENDS:append:rpi = " rpi-u-boot-scr rpi-bootfiles"

UBOOT_RPI4_SUPPORT_PATCHES = " \
    file://0001-rpi_4-defconfigs-Add-CONFIG_CMD_BOOT-menu.patch \
    file://0002-rpi.h-Add-ostree-default-variables.patch \
    file://boot_cmd.patch \
    file://pcie-usb-linux-yocto.patch \
    file://0001-qemu-arm64-Defaults-for-booting-with-ostree.patch \
    file://0002-usb_kbd-Do-not-fail-the-keyboard-if-it-does-not-have.patch \
    file://0003-common-usb.c-Work-around-keyboard-reporting-USB-devi.patch \
    file://0004-xhci-ring.c-Add-the-poll_pend-state-to-properly-abor.patch \
    file://0005-xhci-ring-Fix-crash-when-issuing-usb-reset.patch \
    file://0006-usb.c-Add-a-retry-in-the-usb_prepare_device.patch \
    file://0001-configs-rpi_arm64-Add-CONFIG_ENV_OVERWRITE-in-defcon.patch \
"

SRC_URI:append:raspberrypi4 = "${UBOOT_RPI4_SUPPORT_PATCHES}"

# Also build a specfic qemu-u-boot.bin

do_configure:append:rpi() {
    rm -rf ${B}-qemu
    mkdir -p ${B}-qemu
    oe_runmake -C ${S} O=${B}-qemu qemu_arm64_config
}

do_compile:append:rpi() {
    echo ${UBOOT_LOCALVERSION} > ${B}-qemu/.scmversion
    oe_runmake -C ${S} O=${B}-qemu ${UBOOT_MAKE_TARGET}
}

do_deploy:append:rpi() {
    ocwd=$PWD
    install -D -m 644 ${B}-qemu/${UBOOT_BINARY} ${DEPLOYDIR}/qemu-${UBOOT_IMAGE}
    cd ${DEPLOYDIR}
    rm -f qemu-${UBOOT_BINARY} qemu-${UBOOT_SYMLINK}
    ln -sf qemu-${UBOOT_IMAGE} qemu-${UBOOT_SYMLINK}
    ln -sf qemu-${UBOOT_IMAGE} qmeu-${UBOOT_BINARY}
    cd $ocwd
}

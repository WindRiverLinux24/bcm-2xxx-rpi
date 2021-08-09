FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:bcm-2xxx-rpi4 = " file://hidden-suspend-button.patch"

SUMMARY = "bitbake-layers for gpio"

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("*     GPTO recipe created by bitbake-layers   *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

addtask display_banner before do_build

DESCRIPTION = "GPIO Kernel Driver Example"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=b97a012949927931feb7793eee5ed924"

SRC_URI = "git://github.com/Embetronicx/Tutorials.git;branch=master;protocol=https"
SRCREV = "${AUTOREV}"
SRC_URI += "file://LICENSE"

S = "${WORKDIR}/git/Linux/Device_Driver/GPIO-in-Linux-Device-Driver"

#MODULE_NAME = "driver"
MODULE_NAME = "kernel-module-driver"


inherit module

# Specify where to install the module
MODULE_INSTALL_PATH = "${D}/lib/modules/${KERNEL_VERSION}/extra"

do_compile() {
    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
    make -C ${STAGING_KERNEL_DIR} M=${S} modules
}

do_install() {
    install -d ${MODULE_INSTALL_PATH}
    install -m 0644 ${S}/driver.ko ${MODULE_INSTALL_PATH}

    install -d ${D}${sysconfdir}/init.d
    install -m 0644 ${WORKDIR}/gpio_load ${D}${sysconfdir}/init.d/gpio_load
}

DEPENDS += "virtual/kernel"

FILES:${PN} += "/lib/modules/${KERNEL_VERSION}/extra/${MODULE_NAME}.ko" 

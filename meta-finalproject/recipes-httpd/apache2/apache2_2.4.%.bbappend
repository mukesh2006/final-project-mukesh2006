FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://httpd.conf \
            file://index.php \
            file://test.php"


EXTRA_OECONF += " --enable-modphp"

do_install:append() {
    echo "Contents of WORKDIR: ${WORKDIR}"
    ls -al ${WORKDIR}
    # Remove the default httpd.conf if necessary
    rm -f ${D}${sysconfdir}/apache2/httpd.conf

    # Install the custom httpd.conf
    install -d ${D}${sysconfdir}/apache2
    install -m 0644 ${WORKDIR}/httpd.conf ${D}${sysconfdir}/apache2/httpd.conf

    # Install index.php to /var/www/html
    install -d ${D}/var/www/html
    install -m 0644 ${WORKDIR}/index.php ${D}/var/www/html/index.php
    install -m 0644 ${WORKDIR}/test.php ${D}/var/www/html/test.php
}

FILES:${PN} += "${sysconfdir}/apache2/httpd.conf"

# Associate installed files with apache2 package
FILES:${PN} += "/var"
FILES:${PN} += "/var/www"
FILES:${PN} += "/var/www/html"
FILES:${PN} += "/var/www/html/index.php"
FILES:${PN} += "/var/www/html/test.php"
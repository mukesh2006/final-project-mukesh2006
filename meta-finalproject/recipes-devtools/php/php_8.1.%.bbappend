#DEPENDS += " apache2-native"
#DEPENDS += "  perl-native"

EXTRA_OECONF +=" --enable-cli \
    --enable-cgi \
    "

#    --enable-shared 
#EXTRA_OEMAKE += "APXS=${STAGING_BINDIR_NATIVE}/apxs"

#RDEPENDS:${PN} += " apache2"
#RDEPENDS:${PN} += " php"
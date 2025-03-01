IMAGE_INSTALL:append = " gpio"
IMAGE_INSTALL:append = " apache2"
IMAGE_INSTALL:append = " php"

IMAGE_INSTALL:remove = " nginx lighttpd sthttpd libmicrohttpd apache-websocket"
PACKAGECONFIG:remove = " nginx lighttpd sthttpd libmicrohttpd apache-websocket"

#!/bin/sh

if test "${CHECKOUT}"x = "HEADx"; then
    GITV="HEAD"
    VERSION="git$(date '+%Y-%m-%d')r$(git rev-parse --short ${GITV})-1"
    PACKAGE="9999+${VERSION}"
else
    PACKAGE="${VERSION}"
fi

fpm -t deb -s python --python-bin python3 --python-pip pip3 -v ${PACKAGE} \
    --replaces python-kismetcapturertl433 \
    --depends python3 \
    --depends python3-protobuf \
    --depends python3-usb \
    --depends librtlsdr0 \
    --python-package-name-prefix python3 \
    --python-setup-py-arguments '--prefix=/usr' \
    --python-install-lib /usr/lib/python3/dist-packages \
    ./capture_sdr_rtl433 &
 
fpm -t deb -s python --python-bin python3 --python-pip pip3 -v ${PACKAGE} \
    --replaces python-kismetcapturertlamr \
    --depends python3 \
    --depends python3-protobuf \
    --depends python3-usb \
    --depends librtlsdr0 \
    --python-package-name-prefix python3 \
    --python-setup-py-arguments '--prefix=/usr' \
    --python-install-lib /usr/lib/python3/dist-packages \
    ./capture_sdr_rtlamr &

fpm -t deb -s python --python-bin python3 --python-pip pip3 -v ${PACKAGE} \
    --replaces python-kismetcapturertladsb \
    --depends python3 \
    --depends python3-protobuf \
    --depends python3-usb \
    --depends python3-numpy \
    --depends librtlsdr0 \
    --python-package-name-prefix python3 \
    --python-setup-py-arguments '--prefix=/usr' \
    --python-install-lib /usr/lib/python3/dist-packages \
    ./capture_sdr_rtladsb &

fpm -t deb -s python --python-bin python3 --python-pip pip3 -v ${PACKAGE} \
    --replaces python-kismetcapturefreaklabszigbee \
    --depends python3 \
    --depends python3-protobuf \
    --depends python3-usb \
    --depends python3-serial \
    --python-package-name-prefix python3 \
    --python-setup-py-arguments '--prefix=/usr' \
    --python-install-lib /usr/lib/python3/dist-packages \
    --python-disable-dependency pyserial \
    ./capture_freaklabs_zigbee &

wait


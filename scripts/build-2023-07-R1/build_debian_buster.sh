#!/bin/sh -e

cd /build

git clone --recursive /kismet
cd kismet
git checkout master

if [ "${CHECKOUT}"x != "x" ]; then
	echo "Checking out ${CHECKOUT}"
	git checkout ${CHECKOUT}
fi

./configure \
    --prefix=/usr \
    --sysconfdir=/etc/kismet \
    --disable-element-typesafety \
    --disable-libwebsockets \
    --disable-wifi-coconut

if [ "${NCORES}" = "" ]; then 
	NCORES=$(nproc)
fi
make -j${NCORES}

/tmp/fpm/fpm_debian_buster.sh
/tmp/fpm/fpm_noarch_python3_deb.sh

mv -v *.deb /dpkgs


#!/bin/sh -e

if [ "${VERSION}"x != "x" ]; then
    echo "Linking ${VERSION}"
    ln -s /scripts/fpm-${VERSION} /tmp/fpm
    ln -s /scripts/build-${VERSION} /tmp/build
else
    ln -s /scripts/fpm-master /tmp/fpm
    ln -s /scripts/build-master /tmp/build
fi

exec /tmp/build/build_focal.sh

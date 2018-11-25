#!/bin/bash

export NGINX_VERSION=1.12.2
export UBUNTU_VERSION=14.04
export VERSION_SUFFIX=0+trusty0+pushstream1
export PKGNAME=nginx_$NGINX_VERSION-$VERSION_SUFFIX\_source.changes

git clone https://github.com/wandenberg/nginx-push-stream-module.git

mv nginx-push-stream-module nginx-$NGINX_VERSION/contrib

patch -p0 < /nginx-$NGINX_VERSION-ubuntu-$UBUNTU_VERSION.patch

cd nginx-$NGINX_VERSION

dpkg-source --commit

debuild -S -sa

cd ..

debsign $PKGNAME
dput ppa:dotz/nginx-with-push-stream-module $PKGNAME

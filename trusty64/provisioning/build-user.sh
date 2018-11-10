#!/bin/bash

export NGINX_VERSION=1.12.2
export UBUNTU_VERSION=14.04
export VERSION_SUFFIX=0+trusty0+pushstream0
export PKGNAME=nginx_$NGINX_VERSION-$VERSION_SUFFIX\_source.changes

patch -p0 < /nginx-$NGINX_VERSION-ubuntu-$UBUNTU_VERSION.patch

cd nginx-$NGINX_VERSION

debuild -S -sa

cd ..

debsign $PKGNAME
dput ppa:dotz/nginx-with-push-stream-module $PKGNAME

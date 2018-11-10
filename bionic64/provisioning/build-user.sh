#!/bin/bash

export NGINX_VERSION=1.14.1
export VERSION_SUFFIX=0+bionic0+pushstream0
export UBUNTU_VERSION=18.04
export PKGNAME=nginx_$NGINX_VERSION-$VERSION_SUFFIX\_source.changes

patch -p0 < /nginx-$NGINX_VERSION-ubuntu-$UBUNTU_VERSION.patch

cd nginx-$NGINX_VERSION

debuild -S -sa

cd ..

ls -las

debsign $PKGNAME
dput ppa:dotz/nginx-with-push-stream-module $PKGNAME

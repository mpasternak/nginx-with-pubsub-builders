#!/bin/bash

export NGINX_VERSION=1.14.1
export VERSION_SUFFIX=0+xenial0+pushstream1
export UBUNTU_VERSION=16.04

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

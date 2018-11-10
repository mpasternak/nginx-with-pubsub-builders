#!/bin/bash

export NGINX_VERSION=1.14.1
export UBUNTU_VERSION=18.04
export PKGNAME=nginx_$NGINX_VERSION-0+bionic0_source.changes

patch -p0 < /nginx-$NGINX_VERSION-ubuntu-$UBUNTU_VERSION.patch

cd nginx-$NGINX_VERSION

debuild -S -sa

mkdir -p /vagrant/debs

cp /home/vagrant/*.deb /vagrant/debs

cd ..

debsign $PKGNAME
dput ppa:dotz/nginx-with-push-stream-module $PKGNAME

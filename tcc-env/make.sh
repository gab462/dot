#!/bin/sh

git clone https://git.musl-libc.org/git/musl \
	&& pushd musl \
	&& mkdir usr build \
	&& pushd build \
	&& ../configure --prefix=$PWD/../usr \
	&& make -j4 \
	&& make install \
	&& popd && popd \
	&& git clone https://repo.or.cz/tinycc.git \
	&& pushd tinycc \
	&& mkdir usr build \
	&& pushd build \
	&& ../configure --prefix=$PWD/../usr --config-musl --sysroot=$PWD/../../musl --crtprefix=$PWD/../../musl/usr/lib \
	&& make -j4 \
	&& make install

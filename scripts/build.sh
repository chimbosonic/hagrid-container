#!/bin/bash
set -e

REPO=https://gitlab.com/hagrid-keyserver/hagrid.git

function install_deps() {
	echo "deb http://deb.debian.org/debian testing main" > /etc/apt/sources.list.d/testing-nettle.list
	echo "Package: *\nPin: release a=testing\nPin-Priority: 150" > /etc/apt/preferences.d/limit_testing
	apt-get update -y
	apt-get install -y libclang-dev build-essential pkg-config clang nettle-dev/testing gettext git
}

function prep_build() {
	mkdir -p /build
	cd /build
	git clone https://gitlab.com/hagrid-keyserver/hagrid.git
}

function build() {
	cd /build/hagrid
	cargo build --release
}

install_deps
prep_build
build

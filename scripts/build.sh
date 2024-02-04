#!/bin/bash
set -e

REPO=https://gitlab.com/hagrid-keyserver/hagrid.git

function install_deps() {
	apt-get update -y
	apt-get install -y build-essential pkg-config clang libclang-dev libssl-dev gettext zsh git
}

function prep_build() {
	mkdir -p /build
	cd /build
	git clone https://gitlab.com/hagrid-keyserver/hagrid.git
}

function build() {
	cd /build/hagrid
	./make-translated-templates
	cargo build --release
}

install_deps
prep_build
build

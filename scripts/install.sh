#!/bin/bash

function install_deps() {
  echo "deb http://deb.debian.org/debian testing main" > /etc/apt/sources.list.d/testing-nettle.list
  echo "Package: *\nPin: release a=testing\nPin-Priority: 150" > /etc/apt/preferences.d/limit_testing
  apt-get update -y
  apt-get install -y nettle-dev/testing gettext
}

function prep_install {
  mkdir -p /hagrid_template/
  mkdir -p /var/lib/hagrid/
}

install_deps

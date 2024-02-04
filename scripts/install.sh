#!/bin/bash

function install_deps() {
  apt-get update -y
  apt-get install -y gettext
}

function prep_install {
  mkdir -p /hagrid_template/
  mkdir -p /var/lib/hagrid/
}

install_deps

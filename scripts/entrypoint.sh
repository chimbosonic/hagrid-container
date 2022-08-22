#!/bin/bash

function copy_template_dir() {
	mkdir -p /var/lib/hagrid/public/
	cp -R /hagrid_template/assets  /var/lib/hagrid/public/assets
	cp -R /hagrid_template/templates  /var/lib/hagrid/templates
	cp -R /hagrid_template/email-templates  /var/lib/hagrid/email-templates
	cp -R /hagrid_template/Rocket.toml  /var/lib/hagrid/Rocket.toml
}

function start_hagrid() {
	/usr/bin/env --chdir=/var/lib/hagrid hagrid
}


if [ ! -f /var/lib/hagrid/Rocket.toml ]; then
	echo "Hagrid folder not populate generating config"
	copy_template_dir
fi

start_hagrid

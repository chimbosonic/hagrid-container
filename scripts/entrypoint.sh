#!/bin/bash

function copy_template_dir() {
	cp -R /hagrid_template/* /var/lib/hagrid/
}

function start_hagrid() {
	/usr/bin/env --chdir=/var/lib/hagrid ROCKET_ENV="production" hagrid
}

function create_rocket_config() {
cat << EOF > /var/lib/hagrid/Rocket.toml
[global]
address = "0.0.0.0"
port = ${port}

[production]
base-URI = "${base_URI}"
from = "${from}"
x-accel-redirect = ${x_accel_redirect}
token_secret = "${token_secret}"
token_validity = ${token_validity}
template_dir = "templates"
assets_dir = "assets"
keys_internal_dir = "keys"
keys_external_dir = "public/keys"
token_dir = "tokens"
tmp_dir = "tmp"
mail_rate_limit = ${mail_rate_limit}
maintenance_file = "maintenance"
enable_prometheus = false
email_template_dir = "email-templates"
EOF
}

if [ ! -f /var/lib/hagrid/Rocket.toml ]; then
	echo "Hagrid folder not populate generating config"
	copy_template_dir
	create_rocket_config
fi

start_hagrid

#!/bin/sh

#DEBUG: need to remove later because these are going to set by docker compose.
export MARIADB_USER="ochoumou"
export MARIADB_PASS="password"
export MARIADB_HOST="localhost"
export MARIADB_DBNAME="wordpress"

echo "[+] Installing php-fpm"
apt-get update && \
apt-get -y install php php-cli php-mysql php-gd php-xml php-fpm && \
apt-get clean

echo "[+] Installing wordpress"

cd /tmp
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* /var/www/html/
cd /var/www/html/

sed -i "s/database_name_here/$MARIADB_DBNAME/g" wp-config-sample.php
sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
sed -i "s/password_here/$MARIADB_PASS/g" wp-config-sample.php
sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php

#DEBUG: check that the variables are getting replaced by sed.
cp wp-config-sample.php wp-config.php

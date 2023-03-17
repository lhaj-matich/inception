#!/bin/sh

#DEBUG: need to remove later because these are going to set by docker compose.
export MARIADB_USER="ochoumou"
export MARIADB_PASS="password"
export MARIADB_HOST="localhost"
export MARIADB_DBNAME="wordpress"

#DEBUG: php-fpm should be included into the image because it takes more time
echo "[+] Installing php-fpm"
apt update
apt install wget -y php php-fpm 
# apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
apt clean

echo "[+] Installing wordpress"

# should run the download of wordpress inside the image so that wordpress setup will run much faster

cd /tmp
wget http://wordpress.org/latest.tar.gz
if test -f "latest.tar.gz"; then
tar xfz latest.tar.gz
mkdir -p /var/www/html/
mv wordpress/* /var/www/html/
cd /var/www/html/

sed -i "s/database_name_here/$MARIADB_DBNAME/g" wp-config-sample.php
sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
sed -i "s/password_here/$MARIADB_PASS/g" wp-config-sample.php
sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php

#DEBUG: check that the variables are getting replaced by sed.
cp wp-config-sample.php wp-config.php
echo "[+] Installing wordpress complete."
else
    echo "[-] Downloading wordpress failed."
fi

php-fpm7.4 -F -R
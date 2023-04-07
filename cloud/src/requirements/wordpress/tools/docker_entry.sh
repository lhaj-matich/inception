#!/bin/sh

#DEBUG: need to remove later because these are going to set by docker compose.
export MARIADB_USER="wp_user"
export MARIADB_PASS="biden_1234"
export MARIADB_HOST="mariadb:3306"
export MARIADB_DBNAME="wordpress"

#DEBUG: php-fpm should be included into the image because it takes more time
mkdir -p /run/php
sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf

# should run the download of wordpress inside the image so that wordpress setup will run much faster
if test -f "latest.tar.gz"; then
tar xfz latest.tar.gz
mkdir -p /var/www/html/wordpress/
cp -r wordpress/* /var/www/html/wordpress/

sed -i "s/database_name_here/$MARIADB_DBNAME/g" /var/www/html/wordpress/wp-config-sample.php
sed -i "s/username_here/$MARIADB_USER/g" /var/www/html/wordpress/wp-config-sample.php
sed -i "s/password_here/$MARIADB_PASS/g" /var/www/html/wordpress/wp-config-sample.php
sed -i "s/localhost/$MARIADB_HOST/g" /var/www/html/wordpress/wp-config-sample.php

#DEBUG: check that the variables are getting replaced by sed.
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
else
    echo "[-] Downloading wordpress failed."
fi

echo "[+] php-fpm listenning on 9000."
exec php-fpm7.4 -F -R
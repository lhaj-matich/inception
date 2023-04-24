#!/bin/sh

#! Check no to run this script everytime the container starts.
#DEBUG: need to remove later because these are going to set by docker compose.
export MARIADB_USER="wp_user"
export MARIADB_PASS="biden_1234"
export MARIADB_HOST="mariadb:3306"
export MARIADB_DBNAME="wordpress"

#DEBUG: php-fpm should be included into the image because it takes more time
mkdir -p /run/php
sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf

#! maybe i should change the file that am testing for i mean latest.tar.gz
if test -f "latest.tar.gz"; then
    tar xfz latest.tar.gz
    mkdir -p /var/www/html/wordpress/
    cp -r wordpress/* /var/www/html/wordpress/
    cp wp-config-sample.php /var/www/html/wordpress/

    sed -i "s/database_name_here/$MARIADB_DBNAME/g" /var/www/html/wordpress/wp-config-sample.php
    sed -i "s/username_here/$MARIADB_USER/g" /var/www/html/wordpress/wp-config-sample.php
    sed -i "s/password_here/$MARIADB_PASS/g" /var/www/html/wordpress/wp-config-sample.php
    sed -i "s/localhost/$MARIADB_HOST/g" /var/www/html/wordpress/wp-config-sample.php

    #! Further check here not to download and extract the plugin twice.
    echo "Extracting plugin."
    unzip -q redis-cache.latest-stable.zip -d /var/www/html/wordpress/wp-content/plugins/
    #DEBUG: check that the variables are getting replaced by sed.
    cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
    chown -R www-data:www-data /var/www/html/
    echo "Configuring wordpress again."
else
    echo "Downloading wordpress failed."
fi

echo "Wordpress is listenning on port 9000"
exec php-fpm7.4 -F -R
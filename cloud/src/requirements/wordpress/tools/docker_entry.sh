#!/bin/sh

#! Check no to run this script everytime the container starts.
#DEBUG: need to remove later because these are going to set by docker compose.
#DEBUG: php-fpm should be included into the image because it takes more time
mkdir -p /run/php
sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf

if [ ! -e "/usr/local/bin/wp" ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

#! maybe i should change the file that am testing for i mean latest.tar.gz
if [ ! -e "/var/www/html/wordpress/wp-config.php" ]; then
    echo "Extracting wordpress."
    tar xfz latest.tar.gz
    mkdir -p /var/www/html/wordpress/
    cp -r wordpress/* /var/www/html/wordpress/
    cp wp-config-sample.php /var/www/html/wordpress/

    sed -i "s/database_name_here/$MARIADB_DBNAME/g" /var/www/html/wordpress/wp-config-sample.php
    sed -i "s/username_here/$MARIADB_USER/g" /var/www/html/wordpress/wp-config-sample.php
    sed -i "s/password_here/$MARIADB_PASS/g" /var/www/html/wordpress/wp-config-sample.php
    sed -i "s/localhost/$MARIADB_HOST/g" /var/www/html/wordpress/wp-config-sample.php
    cd /var/www/html/wordpress
    wp core install --url="ochoumou.42.fr" --title="Inception" --admin_user="${WP_USER}" --admin_password="${WP_PASS}" --admin_email="admin@ochoumou.42.fr" --skip-email --skip-config
    #! Further check here not to download and extract the plugin twice.
    cd /tmp
    echo "Extracting and activating redis plugin."
    unzip -q redis-cache.latest-stable.zip -d /var/www/html/wordpress/wp-content/plugins/
    cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

    # wp redis enable --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress

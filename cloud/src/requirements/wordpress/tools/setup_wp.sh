#!/bin/sh

mkdir -p /run/php
mkdir -p /var/www/html/wordpress
sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf

if [ ! -e "/usr/local/bin/wp" ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Downloading wordpress
wp core download --path=/var/www/html/wordpress --allow-root

# Create a new WordPress installation
sed -i "s/database_name_here/$MARIADB_DBNAME/g" wp-config-sample.php
sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
sed -i "s/password_here/$MARIADB_PASS/g" wp-config-sample.php
sed -i "s/localhost/$MARIADB_HOST/g" wp-config-sample.php

cp wp-config-sample.php /var/www/html/wordpress/wp-config.php

# Change the owner for wordpress folder
chown -R www-data:www-data /var/www/html/wordpress


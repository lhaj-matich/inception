#!/bin/sh

mkdir -p /run/php
sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf

tar xfz latest.tar.gz
mkdir -p /var/www/html/wordpress/
cp -r wordpress/* /var/www/html/wordpress/

if [ ! -e "/usr/local/bin/wp" ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Create a new WordPress installation
wp config create --path=/var/www/html/wordpress --dbname=${MARIADB_DBNAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASS} --dbhost=${MARIADB_HOST} --dbprefix=wp_ --allow-root --extra-php <<PHP
define('WP_CACHE', true);
define('WP_REDIS_CLIENT', 'phpredis');
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_REDIS_DATABASE', '0');
define('WP_CACHE_KEY_SALT', 'ochoumou.42.fr');
PHP

wp core install --path=/var/www/html/wordpress --url="ochoumou.42.fr" --title="Inception" --admin_user="${WP_USER}" --admin_password="${WP_PASS}" --allow-root --skip-email
# Install Redis and activate Redis object caching
wp plugin install redis-cache --allow-root --activate
# Change the owner for wordpress folder
chown -R www-data:www-data /var/www/html/wordpress
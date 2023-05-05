#!/bin/sh

WORDPRESS_PATH="/var/www/html/wordpress"


if ! wp core is-installed --path=$WORDPRESS_PATH --allow-root; then
    wp core install --path=$WORDPRESS_PATH --url="ochoumou.42.fr" --title="Inception" --admin_user="${WP_USER}" --admin_password="${WP_PASS}" --admin_email="admin@ochoumou.42.fr" --allow-root --skip-email
    # Install Redis and activate Redis object caching
    wp plugin install redis-cache --activate --path=$WORDPRESS_PATH --allow-root
    wp redis enable --path=$WORDPRESS_PATH --allow-root
fi

echo "Wordpress is listenning on port 9000"
exec php-fpm7.4 -F -R
#!/bin/sh

if [ ! -d "/var/www/html/adminer" ]; then
    mkdir -p /run/php
    sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9001/g" /etc/php/7.4/fpm/pool.d/www.conf

    mkdir -p /var/www/html/adminer/
    mv /tmp/adminer-4.8.1.php /var/www/html/adminer/index.php
fi

echo "Adminer is listenning on port 9001"
exec php-fpm7.4 -F -R
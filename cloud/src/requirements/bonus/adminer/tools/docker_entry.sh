#!/bin/sh

if [ ! -d "/var/www/html/adminer" ]; then
    mkdir -p /run/php
    sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9001/g" /etc/php/7.4/fpm/pool.d/www.conf

    mkdir -p -v /var/www/html/adminer/
    wget -O /var/www/html/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
fi

echo "Adminer is listenning on port 9001"
exec php-fpm7.4 -F -R
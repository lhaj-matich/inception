#!/bin/sh

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-signing.key \
    -out /etc/ssl/certs/nginx-cert.crt \
    -subj "/C=MA/ST=Kh/L=Kh/O=42 Network. /OU=IT Department/CN=1337.ma"
sudo openssl dhparam -out /etc/nginx/dhparam.pem 4096


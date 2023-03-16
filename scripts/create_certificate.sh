#!/bin/sh

sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -sha384 -keyout server-cert.key -out server-cert.crt

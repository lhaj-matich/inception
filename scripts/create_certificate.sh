#!/bin/sh

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server-cert.key -out server-cert.crt


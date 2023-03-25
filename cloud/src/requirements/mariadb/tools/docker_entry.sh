#!/bin/sh

# Allow execute permissions to these scripts
chmod +x db_setup.sh
chmod +x wp_setup.sh
# Setup the databases for wordpress and mariadb
bash db_setup.sh
bash wp_setup.sh
# Stop mariadb service
service mariadb stop
# Start mariadb server in the foreground
mariadbb --bind-address=0.0.0.0
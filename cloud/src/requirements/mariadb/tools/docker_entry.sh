#!/bin/sh

# Allow execute permissions to these scripts
chmod +x db_setup.sh
chmod +x wp_setup.sh
# Setup the databases for wordpress and mariadb and Stop mariadb service
./db_setup.sh && ./wp_setup.sh && service mariadb stop
# Start mariadb server in the foreground
mariadbd --bind-address=0.0.0.0
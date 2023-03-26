#!/bin/sh

#!DEBUG every password will be intel_amd just as placeholder for the setup.

# Start mariadb server only if its off
RESULT=`ps ax | grep [m]ariadb | wc -l`
if [ $RESULT -eq 0 ]; then
  service mariadb start
fi
# Delete anonymous users
# mariadb -e "DELETE FROM mysql.user WHERE user='';"
# Ensure the root user can not log in remotely
mariadb -e "DELETE FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# Remove the test database
mariadb -e "DROP DATABASE IF EXISTS test;"
mariadb -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# Creating new user with root privileges and allow remote connection
mariadb -e "GRANT ALL ON *.* TO 'raptor'@'%' IDENTIFIED BY 'biden_1234' WITH GRANT OPTION;"
# Commit the changes
mariadb -e "FLUSH PRIVILEGES;"
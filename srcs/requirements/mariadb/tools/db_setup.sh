#!/bin/sh

#!DEBUG every password will be intel_amd just as placeholder for the setup.
# Start mariadb server only if its off,,
RESULT=`ps ax | grep [m]ysql | wc -l`
if [ $RESULT -eq 0 ]; then
  service mysql start
fi

# Delete anonymous users
mysql -e "DELETE FROM mysql.user WHERE user='';"
# Ensure the root user can not log in remotely
mysql -e "DELETE FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# Remove the test database
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# Creating new user with root privileges and allow remote connection.
mysql -e "GRANT ALL ON *.* TO '${WP_USER}'@'%' IDENTIFIED BY '${MARIADB_PASS}' WITH GRANT OPTION;"
# Commit the changes.
mysql -e "FLUSH PRIVILEGES;"
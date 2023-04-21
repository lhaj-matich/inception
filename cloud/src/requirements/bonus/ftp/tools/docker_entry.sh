#!/bin/sh
# Add FTP_USER and FTP_PASS variables for the script to use

export FTP_USER="wp_user"
export FTP_PASS="biden_1234"

# Add the user that will be responsible for logging in

if [ ! -e /etc/vsftp_status ]; then
    useradd -m -p $(openssl passwd -1 $FTP_PASS) $FTP_USER
    usermod -d /var/www/html/wordpress $FTP_USER
    echo $FTP_USER >> /etc/vsftpd.userlist
    chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress
    mkdir -p /var/run/vsftpd
    chmod 755 /var/run/vsftpd
    chmod 755 /var/www/html/wordpress
    touch /etc/vsftp_status
fi

# exec vsftpd
/usr/sbin/vsftpd
echo "FTP is listenning on port 21"
# Start the vsftp server in the forground
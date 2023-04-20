FROM debian:11.6

RUN apt update && apt install vsftpd openssl -y
RUN mkdir -p /var/www/html/wordpress

WORKDIR /tmp

# COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/docker_entry.sh .

RUN chmod +x ./docker_entry.sh && ./docker_entry.sh

EXPOSE 21
EXPOSE 50000-50010

#
CMD [ "vsftpd"]
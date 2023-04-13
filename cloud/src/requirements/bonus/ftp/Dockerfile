FROM alpine:3.17.2

RUN apk add vsftpd
RUN mkdir -p /var/www/html

COPY ./conf/vsftpd.conf /etc/vsftpd

EXPOSE 21
ENTRYPOINT [ "vsftpd" ]
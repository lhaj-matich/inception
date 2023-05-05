FROM alpine:3.17.3

RUN	apk update && apk add --no-cache vsftpd shadow openssl
RUN mkdir -p /var/www/html/wordpress

ARG FTP_USER FTP_PASS
ENV FTP_USER=${FTP_USER}
ENV FTP_PASS=${FTP_PASS}

WORKDIR /tmp

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/docker_entry.sh .

RUN chmod +x ./docker_entry.sh

EXPOSE 21
EXPOSE 50000-50010

ENTRYPOINT [ "./docker_entry.sh" ]
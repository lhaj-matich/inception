FROM alpine:3.17.2

RUN apk add vsftpd openssl
RUN mkdir -p /var/www/html

WORKDIR /tmp

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tools/docker_entry.sh .

RUN chmod +x ./docker_entry.sh

EXPOSE 21
ENTRYPOINT [ "./docker_entry.sh" ]
FROM debian:11.6

RUN apt update && apt install vsftpd openssl -y
RUN mkdir -p /var/www/html

WORKDIR /tmp

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/docker_entry.sh .

RUN chmod +x ./docker_entry.sh

EXPOSE 21
ENTRYPOINT [ "./docker_entry.sh" ]
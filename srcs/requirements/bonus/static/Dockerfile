FROM alpine:3.17.2

RUN apk add --no-cache lighttpd
RUN mkdir -p /var/www/html

COPY ./assets/ /var/www/html/
COPY ./conf/lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 2500

ENTRYPOINT [ "lighttpd" , "-D" , "-f" , "/etc/lighttpd/lighttpd.conf"]
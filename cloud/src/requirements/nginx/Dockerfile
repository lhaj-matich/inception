FROM alpine:3.17.2
RUN apk update && apk add nginx

WORKDIR /var/www/html
COPY ./conf/nginx.conf /etc/nginx/
COPY ./assets .
EXPOSE 80
CMD ["nginx -s reload"]
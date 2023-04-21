FROM alpine:3.17.3
RUN apk update && apk add nginx openssl

WORKDIR /var/www/html/wordpress
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-signing.key \
    -out /etc/ssl/certs/nginx-cert.crt \
    -subj "/C=MA/ST=Kh/L=Kh/O=42 Network. /OU=IT Department/CN=1337.ma"
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/proxy_params /etc/nginx/
COPY ./conf/self-signed.conf /etc/nginx/snippets/
COPY ./conf/ssl-params.conf /etc/nginx/snippets/
# The command bellow is just for testing purposes...
COPY ./assets .
EXPOSE 443
# This command will run nginx in no demaon mode...
CMD ["nginx", "-g", "daemon off;"]
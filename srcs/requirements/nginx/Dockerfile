FROM alpine:3.18.4

RUN apk update

RUN apk --no-cache add nginx openssl && \
    mkdir -p /etc/nginx/ssl /var/log/nginx

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/agimi.key -out /etc/nginx/ssl/agimi.crt -days 365 -subj "/C=MA/L=Tetouan/O=1337/OU=agimi/CN=agimi.42.fr/UID=agimi"

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

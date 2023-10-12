FROM	debian:buster

RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/agimi.key -out /etc/nginx/ssl/agimi.crt -days 365 -subj "/C=MA/L=Tetouan/O=1337/OU=agimi/CN=agimi.42.fr/UID=agimi"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

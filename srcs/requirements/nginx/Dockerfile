FROM alpine:3.19.1

RUN apk update && apk upgrade

RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/agimi.42.fr.key \
  -out /etc/nginx/ssl/agimi.42.fr.crt \
  -subj "/CN=agimi.42.fr"

CMD ["nginx", "-g", "daemon off;"]

FROM alpine:3.18.4

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/bonus/website/conf/* /var/www/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
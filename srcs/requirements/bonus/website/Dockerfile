FROM alpine:3.19.0

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/bonus/website/conf/nginx.conf /etc/nginx/http.d/

EXPOSE 6969

CMD ["nginx", "-g", "daemon off;"]
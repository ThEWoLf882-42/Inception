FROM alpine:3.18.4

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/bonus/website/conf/default.conf /etc/nginx/http.d/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
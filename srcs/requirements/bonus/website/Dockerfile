FROM alpine:3.18.4

RUN	apk update && apk upgrade && apk add --no-cache nginx

RUN	echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "root    /var/www;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf && \
	echo "location ~* \.(js|css|png|jpg|jpeg|gif|ico) {}" >> /etc/nginx/http.d/default.conf
	# echo "    add_header Cache-Control "public, max-age=604800, immutable";" >> /etc/nginx/http.d/default.conf && \
	# echo "}" >> /etc/nginx/http.d/default.conf

COPY requirements/bonus/website/conf/* /var/www/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
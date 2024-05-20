FROM alpine:3.19.1

RUN apk update && apk upgrade

RUN apk add --no-cache \
	php83 \
	php83-phar \
	php83-fpm \
	php83-mysqli \
	php83-iconv \
	php83-mbstring \
	php83-curl \
	php83-json \
	php83-xml \
	php83-zip

RUN	ln -sf /usr/bin/php83 /usr/bin/php && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php83/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php83/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php83/php-fpm.d/www.conf

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	cp -rf wordpress/* . && \
	rm -rf wordpress latest.zip

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/conf/start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "sh", "./start.sh" ]
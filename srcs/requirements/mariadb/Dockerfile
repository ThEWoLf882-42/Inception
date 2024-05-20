FROM alpine:3.19.1

RUN apk update && apk upgrade

RUN apk add --no-cache mariadb mariadb-client

RUN sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i "s|#bind-address=0.0.0.0|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod -R 755 /var/lib/mysql && \
    mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/

COPY ./requirements/mariadb/conf/start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "sh", "/start.sh" ]

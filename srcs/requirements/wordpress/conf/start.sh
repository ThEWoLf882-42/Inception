#!/bin/sh

sleep 3

if [ ! -f "wp-config.php" ]; then
wp config create --allow-root --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" --dbhost="mariadb:3306"

wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}" --allow-root

wp user create "${WP_USER}" "${WP_UEMAIL}" --user_pass="${WP_PASS}" --role=editor --allow-root

fi

chmod -R 0777 wp-content/

exec php-fpm83 -F
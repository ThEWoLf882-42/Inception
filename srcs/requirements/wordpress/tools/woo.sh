#!/bin/sh

wp core install --path=/var/www --url=agimi.42.fr --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"

wp plugin is-installed redis-cache --path=/var/www --allow-root

if [ $? -eq 1 ]
then
    wp plugin install redis-cache --path=/var/www --force --activate --allow-root
else
    echo "redis-cache is already installed"
fi

# Start PHP-FPM in the foreground
exec $@

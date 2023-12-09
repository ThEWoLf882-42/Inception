#!/bin/sh

wp core install --path=/var/www --url=agimi.42.fr --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"

wp config set WP_REDIS_PORT "6379" --allow-root
wp config set WP_REDIS_HOST "redis" --allow-root
wp plugin is-installed redis-cache --allow-root
wp user create ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASS} --role=editor

if [ $? -eq 1 ]
then
    wp plugin install redis-cache --path=/var/www --force --activate --allow-root
else
    echo "redis-cache is already installed"
fi

# Start PHP-FPM in the foreground
exec $@

wp core install --url=agimi.42.fr --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=${WP_EMAIL}
wp plugin is-installed redis-cache --allow-root
if [ $? -eq 1 ]
then
    wp plugin install redis-cache --force --activate --allow-root
else
    echo "redis-cache is already installed"
fi
exec $@
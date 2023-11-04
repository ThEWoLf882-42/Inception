chmod -R 755 /var/www/html
echo Installing wordpress
cd /var/www/html
ls /var/www/html | grep wp-config.php
if [ $? -eq 0 ]
then
    echo "Found Wordpress, skipping"
else
    wp core install --url=agimi.42.fr --title=WP_TITLE --admin_user=WP_ADMIN --admin_password=WP_PASS --admin_email=WP_EMAIL
	wp core install --url=https://hmeftah.42.fr --title="Sarah WP" --admin_user=${WP_ADM} --admin_password=${WP_ADM_PASS} --admin_email="${WP_ADM}"@42.fr --allow-root
fi
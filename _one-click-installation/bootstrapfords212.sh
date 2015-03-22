###### NOTE THAT INSERTING THE VAR DOMAINNAME INTO APACHE SERVER CONF IS NOT TESTET.
#!/usr/bin/env bash
#need git to be installed and a database and user with name huge and pasword as below
# Use single quotes instead of double quotes to make it work with special-character passwords
PASSWORD='BlackseaDeformation1'
PROJECTFOLDER='pcloudserver'
DOMAINNAME='cloudscreen.dk'
# create project folder
mkdir "/volume1/web/${PROJECTFOLDER}/"
git clone https://github.com/sinise/pcloudserver.git "/volume1/web/${PROJECTFOLDER}"

# run SQL statements from install folder
mysql -h "localhost" -u "huge" "-p${PASSWORD}" <"/volume1/web/${PROJECTFOLDER}/application/_installation/01-create-database.sql"
mysql -h "localhost" -u "huge" "-p${PASSWORD}" <"/volume1/web/${PROJECTFOLDER}/application/_installation/02-create-table-users.sql"
mysql -h "localhost" -u "huge" "-p${PASSWORD}" <"/volume1/web/${PROJECTFOLDER}/application/_installation/03-create-table-notes.sql"
mysql -h "localhost" -u "huge" "-p${PASSWORD}" <"/volume1/web/${PROJECTFOLDER}/application/_installation/04-create-table-rpi-etc.sql"
# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
DocumentRoot "/var/services/web/${PROJECTFOLDER}/public"
ServerName "$DOMAINNAME"
<Directory "/var/www/html/${PROJECTFOLDER}/public">
AllowOverride All
Require all granted
</Directory>
ErrorDocument 403 "/webdefault/error.html"
ErrorDocument 404 "/webdefault/error.html"
ErrorDocument 500 "/webdefault/error.html"
</VirtualHost>
EOF
)
echo "${VHOST}" >> /etc/httpd/sites-enabled-user/httpd-vhost.conf-user
# writing rights to avatar folder
#chmod 0777 -R "/volume1/web/${PROJECTFOLDER}/public/avatars"
# final feedback
echo "Voila!"

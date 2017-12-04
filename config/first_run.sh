#!/bin/bash



#### Pre configurations ####
echo "[WEBDEV-INFO] Running Pre configurator"

mkdir -p /var/log/supervisord
mkdir -p /etc/apache2/vhosts
touch /var/log/supervisord/supervisord.log

#### Configuring MySQL ####
echo "[WEBDEV-INFO] Configuring MySQL"

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql >> /dev/null

echo "[WEBDEV-INFO] Configuring MySQL root user"
 
echo "GRANT ALL PRIVILEGES ON *.* to 'root'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password');" | mysql

#### Configuring Apache ####
echo "[WEBDEV-INFO] Configuring Apache"
useradd $APACHE_RUN_USER
echo "IncludeOptional vhosts/*.conf" >> /etc/apache2/apache2.conf
a2enmod proxy_fcgi setenvif
a2enconf php7.0-fpm


#### Running Supervisor ####
echo "[WEBDEV-INFO] Runnign Supervisor"

/bin/bash /run.sh
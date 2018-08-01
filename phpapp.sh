#!/bin/bash -v

#
#
# phpapp.ssh
#
#
# Install PHP 7.1
#
apt-get install software-properties-common
add-apt-repository ppa:ondrej/php -y
apt-get update -y
apt-get install php7.1-fpm php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-cli -y
systemctl restart php7.1-fpm.service
systemctl enable php7.1-fpm.service



#
# Install nginx
#
apt-get update -y
apt-get install -y nginx > /tmp/nginx.log
service nginx start
systemctl enable nginx.service
apt-get update -y


echo "<?php" >> /var/www/html/calldb.php
echo "\$conn = new mysqli('mydatabase.${var.domain}.internal', 'root', 'secret', 'test');" >> /var/www/html/calldb.php
echo "\$sql = 'SELECT * FROM mytable'; " >> /var/www/html/calldb.php
echo "\$result = \$conn->query(\$sql); " >>  /var/www/html/calldb.php
echo "while(\$row = \$result->fetch_assoc()) { echo 'the value is: ' . \$row['mycol'] ;} " >> /var/www/html/calldb.php
echo "\$conn->close(); " >> /var/www/html/calldb.php
echo "?>" >> /var/www/html/calldb.php


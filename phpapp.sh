#!/bin/bash -v

#
#
# phpapp.ssh
#

apt-get update -y
apt-get install -y nginx > /tmp/nginx.log
service nginx start
systemctl enable nginx.service


echo "<?php" >> /var/www/html/calldb.php
echo "\$conn = new mysqli('mydatabase.${var.domain}.internal', 'root', 'secret', 'test');" >> /var/www/html/calldb.php
echo "\$sql = 'SELECT * FROM mytable'; " >> /var/www/html/calldb.php
echo "\$result = \$conn->query(\$sql); " >>  /var/www/html/calldb.php
echo "while(\$row = \$result->fetch_assoc()) { echo 'the value is: ' . \$row['mycol'] ;} " >> /var/www/html/calldb.php
echo "\$conn->close(); " >> /var/www/html/calldb.php
echo "?>" >> /var/www/html/calldb.php


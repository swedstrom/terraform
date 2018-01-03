#!/bin/bash

#
# db.sh MySQL userdata for EC2
#

debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password rootbla'
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password rootbla'
apt-get -y install mysql-server-5.7

/usr/bin/mysqladmin -u root password 'rootbla'
mysql -u root -prootbla -e "create user 'root'@'%' identified by 'rootbla';" mysql
mysql -u root -prootbla -e 'CREATE DATABASE test'
mysql -u root -prootbla -e 'CREATE TABLE mytable (mycol varchar(255));' test
mysql -u root -prootbla -e "INSERT INTO mytable (mycol) values ('ShawnIsTheBest') ;" test

#!/bin/bash

#
# db.sh MySQL userdata for EC2
#

yum update -y
yum install -y mysql55-server
service mysqld start

/usr/bin/mysqladmin -u root password 'secret'
mysql -u root -psecret -e "create user 'root'@'%' identified by 'secret';" mysql
mysql -u root -psecret -e 'CREATE TABLE mytable (mycol varchar(255));' test
mysql -u root -psecret -e "INSERT INTO mytable (mycol) values ('ShawnIsTheBest') ;" test

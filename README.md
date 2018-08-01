
ELB-EC2-DB
==========

This is an example of ELB and 2 EC2 phpapps, and one DB MySQL server

- The EC2's are now based on ubuntu 14.04 AMI

- Web Server is nginx

- The output of the terraform apply will display the web ip address


Config
======

This presumes that there is a file in your home directory ~/.aws/credentials.tfvar that looks like:

    access_key = "AKIblaBLaBlABLA"

    secret_key = "wQh1blaBLAblAbLaBLAbla"

    region = "us-west-2"


To build the Terrafrom run:
===========================

    terraform apply -var-file="~/.aws/credentials.tfvar"
      AWS_DEFAULT_REGION='us-west-1' terraform apply -auto-approve -var-file="~/.aws/credentials.tfvar"

    the AWS_DEFAULT_REGION keeps it so you don't have to keep answering the input question of "what region"


----------------------------
this  stack will create: 1 VPC with IP of 172.28.0.0/16

  Route 53 Entries

  DHCP Entries

1 Private subnet

1 Public subnet

2 security groups - Web App and Database

2 EC2s

    Apache HTTP Server

    MySQL Instance

  MySQL - create TABLE mytable and insert an entrie
Once the simple1 stack is complete:

find the Public IP address:

aws ec2 describe-instances|grep PublicIp

run a command in your browser to read from the database: http://PublicIpAddress/calldb.php

Log into the phpapp server and run host mydatabase.libratech.internal responce: host mydatabase.libratech.internal

Notes:
ec2.tf This line is required in order to get the DB EC2 system to have a Gateway Internet Access depends_on = ["aws_route_table_association.PrivateAZA"]




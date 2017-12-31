
ELB-EC2-DB
==========

This is an example based on simple1 with the addition of an ELB and 2 EC2 phpapps, and one DB MySQL server

This presumes that there is a file in your home directory ~/.aws/credentials.tfvar that looks like:

access_key = "AKIblaBLaBlABLA"
secret_key = "wQh1blaBLAblAbLaBLAbla"
region = "us-west-2"


To build the Terrafrom run:
===========================

    terraform apply -var-file="~/.aws/credentials.tfvar"



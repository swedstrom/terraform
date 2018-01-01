variable "region" {
  default = "us-west-2"
}
variable "AmiLinux" {
  type = "map"
  default = {
    us-east-1 = "ami-aa2ea6d0"
    us-west-2 = "ami-0def3275"
    eu-west-1 = "ami-8fd760f6"
  }
  description = "I add only 3 regions (Virginia, Oregon, Ireland) to show the map feature "
}
variable "domain" {
  default = "libratech"
  description = "The main domain"
}

variable "environment" {
  default = "ELB-EC2-DB}"
  description = "the environment name"
}

variable "environment" {
  default = "dev"
  description = "The system Envrionment"
}

variable "vpc" {
    default = "2teir-environment"
  description = "The VPC "
}

variable "vpc-fullcidr" {
    default = "172.28.0.0/16"
  description = "the vpc cdir"
}

variable "Subnet-Public-AzA-CIDR" {
  default = "172.28.0.0/24"
  description = "public cidr of the subnet"
}

variable "Subnet-Private-AzA-CIDR" {
  default = "172.28.3.0/24"
  description = "private cidr of the subnet"
}

variable "key_name" {
  default = "id_rsa"
  description = "the ssh key to use in the EC2 machines"
}

variable "DnsZoneName" {
  default = "libratech.internal"
  description = "the internal dns name"
}

variable "ssh_ingress" {
  default = "67.161.146.186/32"
}

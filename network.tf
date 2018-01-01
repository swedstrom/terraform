resource "aws_vpc" "terraformmain" {
    cidr_block = "${var.vpc-fullcidr}"
   #### these 2 true values are for use in the internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "Main Terraform Libratech ${var.environment} VPC"
      Terraform = "true"
      Environment = "${var.environment}"
      Stack = "${var.stack}"
    }
}

## DNS and DHCP
resource "aws_vpc_dhcp_options" "mydhcp" {
    domain_name = "${var.DnsZoneName}"
    domain_name_servers = ["AmazonProvidedDNS"]
    tags {
      Name = "My internal name"
      Environment = "${var.environment}"
      Stack = "${var.stack}"
    }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp.id}"
    tags {
      Environment = "${var.environment}"
      Stack = "${var.stack}"
    }
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main" {
  name = "${var.DnsZoneName}"
  vpc_id = "${aws_vpc.terraformmain.id}"
  comment = "Managed by terraform"
  tags {
    Environment = "${var.environment}"
    Stack = "${var.stack}"
   }
}

resource "aws_route53_record" "database" {
   zone_id = "${aws_route53_zone.main.zone_id}"
   name = "mydatabase.${var.DnsZoneName}"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.database.private_ip}"]
   tags {
     Environment = "${var.environment}"
     Stack = "${var.stack}"
    }
}

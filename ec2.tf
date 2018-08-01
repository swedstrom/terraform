#
# The nginx php server EC2
#
resource "aws_instance" "phpapp" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.FrontEnd.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "phpapp"
        Envrionment = "${var.environment}"
        Stack = "${var.stack}"
  }
  user_data = "${file("phpapp.sh")}"
}

#
# The MySQL Database EC2
#
resource "aws_instance" "database" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.Database.id}"]
  depends_on = ["aws_route_table_association.PrivateAZA"]
  key_name = "${var.key_name}"
  tags {
        Name = "database"
         Envrionment = "${var.environment}"
         Stack = "${var.stack}"
  }
  user_data = "${file("db.sh")}"
}

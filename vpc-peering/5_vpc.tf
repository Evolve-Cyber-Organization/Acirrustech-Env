  
resource "aws_vpc" "task4_vpc" {
  
  cidr_block = "${var.vpc_cidr}"
  #cidr_block = "10.0.0.0/16"
  #security_groups = ["${aws_security_group.allow_tls_TASK4.name}"] #bu olunca destroy yapmadi
  tags ="${var.tags}"
}

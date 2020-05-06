resource "aws_route_table" "route_table_private__new" {
  vpc_id = "${aws_vpc.task4_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.task4_IG.id}"
  }

  tags ="${var.tags}"
}

# Route Table association
resource "aws_route_table_association" "prv_11" {
  subnet_id      = "${aws_subnet.task4_private1.id}"
  route_table_id = "${aws_route_table.route_table_private__new.id}"

 
}

resource "aws_route_table_association" "prv_22" {
  subnet_id      = "${aws_subnet.task4_private2.id}"
  route_table_id = "${aws_route_table.route_table_private__new.id}"

  
}

resource "aws_route_table_association" "prv_33" {
  subnet_id      = "${aws_subnet.task4_private3.id}"
  route_table_id = "${aws_route_table.route_table_private__new.id}"


}

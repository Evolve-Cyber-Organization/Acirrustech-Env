resource "aws_route_table" "route_table2" {
  vpc_id = "${aws_vpc.task4_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.task4_IG.id}"
  }

  tags ="${var.tags}"
}

# Route Table association
resource "aws_route_table_association" "c1" {
  subnet_id      = "${aws_subnet.task4_public1.id}"
  route_table_id = "${aws_route_table.route_table2.id}"

 
}

resource "aws_route_table_association" "c2" {
  subnet_id      = "${aws_subnet.task4_public2.id}"
  route_table_id = "${aws_route_table.route_table2.id}"

  
}

resource "aws_route_table_association" "c3" {
  subnet_id      = "${aws_subnet.task4_public3.id}"
  route_table_id = "${aws_route_table.route_table2.id}"


}

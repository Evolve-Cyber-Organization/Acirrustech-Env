resource "aws_eip" "allocation_ip" {
  vpc      = true
  tags ="${var.tags}"
}

resource "aws_nat_gateway" "task3_ng" {
  allocation_id = "${aws_eip.allocation_ip.id}"
  subnet_id     = "${aws_subnet.task4_private1.id}"
  tags ="${var.tags}"
}

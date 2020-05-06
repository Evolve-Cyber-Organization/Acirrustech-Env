resource "aws_internet_gateway" "task4_IG" {
  vpc_id = "${aws_vpc.task4_vpc.id}"

tags ="${var.tags}"

}

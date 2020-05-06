# Public Subnet
resource "aws_subnet" "task4_public1" {
    vpc_id     = "${aws_vpc.task4_vpc.id}"
    cidr_block = "${var.public_cidr1}"
    availability_zone = "${var.region}${var.az1}"
    map_public_ip_on_launch = true
    tags ="${var.tags}"
}


resource "aws_subnet" "task4_public2" {
    vpc_id     = "${aws_vpc.task4_vpc.id}"
    cidr_block = "${var.public_cidr2}"
    availability_zone = "${var.region}${var.az2}"
    map_public_ip_on_launch = true
    tags ="${var.tags}"

}
resource "aws_subnet" "task4_public3" {
    vpc_id     = "${aws_vpc.task4_vpc.id}"
    cidr_block = "${var.public_cidr3}"
    availability_zone = "${var.region}${var.az3}"
    map_public_ip_on_launch = true
    tags ="${var.tags}"
}
#########################################################


# Private subnets
resource "aws_subnet" "task4_private1" {
    vpc_id     = "${aws_vpc.task4_vpc.id}"
    cidr_block = "${var.private_cidr1}"
    availability_zone = "${var.region}${var.az1}"
   
    tags ="${var.tags}"

}



resource "aws_subnet" "task4_private2" {
    vpc_id     = "${aws_vpc.task4_vpc.id}"
    cidr_block = "${var.private_cidr2}"
    availability_zone = "${var.region}${var.az2}"
  
    tags ="${var.tags}"
}



resource "aws_subnet" "task4_private3" {
    vpc_id     = "${aws_vpc.task4_vpc.id}"
    cidr_block = "${var.private_cidr3}"
    availability_zone = "${var.region}${var.az3}"
    
    tags ="${var.tags}"
}

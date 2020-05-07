resource "aws_vpc_peering_connection" "pc" {
  peer_vpc_id = "${module.vpc-virginia.vpc_id}"
  vpc_id      = "${module.vpc-ohio.vpc_id}"
  auto_accept = true
}


resource "aws_route" "vpc_peering_route_virginia" {
  count                     = 2
  route_table_id            = "${module.vpc-virginia.public_route_table_ids[0]}"
  destination_cidr_block    = "${module.vpc-ohio.public_subnets_cidr_blocks[count.index]}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.pc.id}"
}

resource "aws_route" "vpc_peering_route_ohio" {
  count                     = 2
  route_table_id            = "${module.vpc-ohio.public_route_table_ids[0]}"
  destination_cidr_block    = "${module.vpc-virginia.public_subnets_cidr_blocks[count.index]}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.pc.id}"
}

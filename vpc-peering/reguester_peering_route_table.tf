resource "aws_route" "r"{
    route_table_id  ="${aws_route_table.route_table2.id}"
    destination_cidr_block ="${var.vpc_cidr}" 
    vpc_peering_connection_id ="${aws_vpc_peering_connection.peer.id}"
}

resource "aws_route" "r1"{
    route_table_id  ="${aws_route_table.route_table_private__new.id}"
    destination_cidr_block ="${var.vpc_cidr}" 
    vpc_peering_connection_id ="${aws_vpc_peering_connection.peer.id}"
}

##Peering accepter neccessary code_2 it creates route table cconnection
#Steps to follow:
#1. create vpc and give vpc id to the requester
#2. requester will run if it will succed peering connection will be pending
#3. While it pending requester will give to accepter "vpc_peering_connection_id", the id will show up in the bellow of vpc description
#4. accepter should take "VPC Peering Connection" id and paste it as value to "vpc_peering_connection_id" 
#5. Then run the command and peering connection will activated in minutes.
# ACCEPTER AND REQUSTER SHOULD BE IN DIFFERENT REGIONS, AND CIDR BLOKS SHOULD BE DIFFERENT FROM EACH OTHER!!!

#ACTIVATE THIS CODE IF YOU ARE A ACCEPTER

# resource "aws_route" "r" {
#   route_table_id            ="${aws_route_table.route_table2.id}"
#   destination_cidr_block    ="10.0.0.0/16"
#   vpc_peering_connection_id ="pcx-0ae679b9467fc1f65"
# }
# resource "aws_route" "r1" {
#   route_table_id            ="${aws_route_table.route_table_private__new.id}"
#   destination_cidr_block    ="10.0.0.0/16"
#   vpc_peering_connection_id ="pcx-0ae679b9467fc1f65"
# }

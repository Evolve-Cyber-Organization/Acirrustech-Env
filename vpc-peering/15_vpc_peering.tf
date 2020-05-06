# #owner profile
# # provider "aws" {
# #   profile = "${var.owner_profile}"
# #   region  = "${var.region}"
# # }

# #accepter profile 
# provider "aws" {
#   alias = "accepter"
#   region  = "${var.region_accepter}"
#   profile = "${var.accepter_profile}"
# }

# #this code extract the account-id
# data "aws_vpc" "accepter" {
#     provider = "aws.accepter"
#     id = "${var.accepter_vpc_id}"
# }

# locals {
#   accepter_account_id = "${element(split(":", data.aws_vpc.accepter.arn), 4)}"
# }


# #here start to peering and acceptance 
# resource "aws_vpc_peering_connection" "owner" {
#    #vpc_id = "${var.owner_vpc_id}"
#    #peer_vpc_id   = "${data.aws_vpc.accepter.id}"
#    #peer_owner_id = "${local.accepter_account_id}"  
#   vpc_id ="rtb-052dd0133b3c6d984"
#   peer_vpc_id ="vpc-09ec7e1f5eb2448e6"
#   peer_owner_id ="972228761283"
  
#   tags {
#     #Name = "peer_to_${var.accepter_profile}"
#     Name = "Gulsen-sevil_peering"
#   }
# }

# #here start to peering acceptance 
# resource "aws_vpc_peering_connection_accepter" "accepter" {
#  provider                  = "aws.accepter"
#   #vpc_peering_connection_id = "${aws_vpc_peering_connection.owner.id}"
#   vpc_peering_connection_id ="514430043235"
#   auto_accept               = true

#   tags {
#     #Name = "peer_to_${var.owner_profile}"
#      Name = "Gulsen-sevil_peering"
#   }
# }










# #update route tables information using vpc cidr
# data "aws_vpc" "owner" {
#     id = "${var.owner_vpc_id}"
# }


# data "aws_route_tables" "accepter" {
#  provider = "aws.accepter"
#   #vpc_id = "${data.aws_vpc.accepter.id}"
#   vpc_id = "vpc-09ec7e1f5eb2448e6"
# }

# data "aws_route_tables" "owner" {
#   #vpc_id = "${var.owner_vpc_id}"
#   vpc_id ="rtb-052dd0133b3c6d984"
# }


# resource "aws_route" "owner" {
# #   count = "${length(data.aws_route_tables.owner.ids)}"
# #   route_table_id            = "${data.aws_route_tables.owner.ids[count.index]}"
# #   destination_cidr_block    = "${data.aws_vpc.accepter.cidr_block}"
# #   vpc_peering_connection_id = "${aws_vpc_peering_connection.owner.id}"
#     route_table_id  ="rtb-08bc47aa393f470b7"
#     destination_cidr_block ="192.168.0.0/16"
#     vpc_peering_connection_id ="514430043235"

# }   

# resource "aws_route" "accepter" {
#  provider = "aws.accepter"
#   #count = "${length(data.aws_route_tables.accepter.ids)}"
# #   route_table_id            = "${data.aws_route_tables.accepter.ids[count.index]}"
# #   destination_cidr_block    = "${data.aws_vpc.owner.cidr_block}"
# #   vpc_peering_connection_id = "${aws_vpc_peering_connection.owner.id}"
  
#    destination_cidr_block    ="172.31.0.0/16"
#    vpc_peering_connection_id ="vpc-06f284ad983d45f5d"

# } 

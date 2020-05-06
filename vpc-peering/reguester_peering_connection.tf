#IF YOU ARE A ACCEPTER COMMAND OUT THIS CODE
#IF YOU ARE A REGUESTER TAKE ACCEPTER VPC ID AND PASS
#IF YOU ARE A REGUESTER TAKE ACCEPTER ACCOUNT ID AND PASS AS A peer_owner_id

resource "aws_vpc" "peer" {
  provider   = "aws.peer"
  cidr_block = "192.168.0.0/16"
}
data "aws_caller_identity" "peer" {
  provider = "aws.peer"
}
# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = "${aws_vpc.task4_vpc.id}"
  peer_vpc_id   = "vpc-0c0a1675924616418" #ACCEPTER VPC ID
  peer_owner_id = "972228761283"         #ACCEPTER ACCOUNT ID
  peer_region   = "us-east-1"            #ACCEPTER REGION
  auto_accept   = false
  tags = {
    Side = "Requester"
  }
}

#Peering accepter neccessary code_1
#activate this code if you are accepter

# resource "aws_vpc_peering_connection_accepter" "peer" {
#   provider                  = "aws.peer"
#   vpc_peering_connection_id = "pcx-0ae679b9467fc1f65"
#   auto_accept               = true
#   tags = {
#     Side = "Accepter"
#   }
# }


#this file has translation

variable "vpc_cidr" {}
variable "region" {}

variable "key_name" {}

variable "public_cidr1" {}
variable "public_cidr2" {}
variable "public_cidr3" {}

variable "az1" {}
variable "az2" {}
variable "az3" {}

variable "private_cidr1" {}
variable "private_cidr2" {}
variable "private_cidr3" {}

variable "tags" {
 type = "map"
} 



# #variables for vpc peering 

# variable "owner_profile" {}
# variable "accepter_profile" {}
# variable "owner_vpc_id" {}
#  variable "accepter_vpc_id" {}

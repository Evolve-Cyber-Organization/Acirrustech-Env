resource "aws_db_subnet_group" "default" { 

name = "newone" 

subnet_ids = ["subnet-07205b2f", "subnet-d9a0d992", "subnet-a33d13f9"] 

} 
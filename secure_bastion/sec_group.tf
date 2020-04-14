resource "aws_security_group" "secure_bastion" { 
name = "secure_bastion" 
description = "Allows VPN connection" 
vpc_id  = "vpc-66cdee01"


ingress { 
description = "Allows port 22 from school VPN" 
from_port = 22 
to_port = 22 
protocol = "tcp" 
cidr_blocks = ["50.194.68.230/32"]
} 


egress { 
from_port = 0 
to_port = 0 
protocol = "-1" 
cidr_blocks = ["0.0.0.0/0"] 

} 
tags = { 
Name = "secure_bastion" 
} 
}

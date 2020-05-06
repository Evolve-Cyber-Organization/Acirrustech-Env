resource "aws_security_group" "allow_tls_TASK4_db" {
  name        = "allow_tls2_db"
  description = "Allow TLS inbound traffic"
  vpc_id = "${aws_vpc.task4_vpc.id}"
  

ingress {   #inbound rule MY  MYSQL/AUROR
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {   #inbound rule SSH
    description = "TLS from VPC"
    from_port   = 22 
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 

  egress {    #outbond rule
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags ="${var.tags}"
}

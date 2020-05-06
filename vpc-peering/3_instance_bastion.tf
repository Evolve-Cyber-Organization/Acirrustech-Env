resource "aws_instance" "task4" {
  ami = "ami-01e36b7901e884a10" 
  instance_type ="t2.micro"
  key_name = "${aws_key_pair.us-east-2-key_task4.key_name}"
  subnet_id = "${aws_subnet.task4_public1.id}"
  availability_zone = "${var.region}${var.az1}"
  associate_public_ip_address = true
  source_dest_check = false
  vpc_security_group_ids = ["${aws_security_group.allow_tls_TASK4.id}"]  
  #tags ="${var.tags}"

tags = {
    Name = "task4_Bastion"
  }

}

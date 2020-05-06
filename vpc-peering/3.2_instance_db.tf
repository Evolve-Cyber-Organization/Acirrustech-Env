resource "aws_instance" "task4_db" {
  ami = "ami-01e36b7901e884a10" #ami for centos 7 in us-west-2
  #ami = "ami-0db8e77c005d79e33" #ami for centos 6 in us-west-2
  instance_type ="t2.micro"
  key_name = "${aws_key_pair.bastion_key.key_name}"
  subnet_id = "${aws_subnet.task4_private1.id}"
  availability_zone = "${var.region}${var.az1}" #how can we put selection????
  user_data = "${file("11.1_user_data_db.sh")}" 
  associate_public_ip_address = true
  source_dest_check = false 
  vpc_security_group_ids = ["${aws_security_group.allow_tls_TASK4_db.id}"]  
  key_name  =  "${aws_key_pair.bastion_key.key_name}"
  #tags ="${var.tags}"

tags = {
    Name = "task4_DB"
  }

}

resource "aws_instance" "instance" {
  ami               = "ami-0d6621c01e8c2de2c"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.bastion.key_name}"
  vpc_security_group_ids = ["sg-00b7467feb8ff2fd3"]
}
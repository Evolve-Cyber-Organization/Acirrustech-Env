resource "aws_key_pair" "us-east-2-key_task4" {
  #key_name   = "task4_key"
  key_name   = "${var.key_name}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
  tags ="${var.tags}" 

}
  

  resource "aws_key_pair" "bastion_key" {
  key_name   = "task4_Bastion_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
  }

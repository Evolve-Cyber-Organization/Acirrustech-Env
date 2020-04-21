resource "aws_key_pair" "team4" {
  key_name   = "team4"
  public_key = "${file("~/.ssh/id_rsa.pub")}" 
}
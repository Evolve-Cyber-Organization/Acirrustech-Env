resource "aws_key_pair" "test_key" {
    key_name = "bastion-test"
    public_key = "${file("~/.ssh/id_rsa.pub")}"
    
  
}

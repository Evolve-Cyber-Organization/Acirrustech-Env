resource "aws_key_pair" "Bastion-host" {
  key_name   = "Bastion-host"
  public_key = "${file("/ssh_keys/Bastion-host.pub")}"
}

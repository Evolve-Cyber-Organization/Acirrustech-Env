resource "aws_key_pair" "grafana" {
  key_name   = "grafana"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

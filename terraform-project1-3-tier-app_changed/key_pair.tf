resource "aws_key_pair" "bastion" {
  key_name   = "lily"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc1jPmsUmk2DEZHlzZT9DX7eK2fAH+RysLctP+25ZBqC74BmCoeSYCZT0ap1CEmt5UWCDO0xS90GkkL1jQplsuRtwXNUbp5fK48923iNTOtVvP1g8aR2ls9zZrw2O4DLb4jxRcnLaEWoj63M8BhwSRKfajtAgl1BBa1eJBD31tyymcNO5FG/hABrgA5+RvxV4DOZ4OcEsFUwmaVzv2enLlWhBC1wx86pvtdNj7cZS3KwloluKau8/ZlXTCuqPowz4P1isy2MpWOrvj6z3yYjC8Vb5n0MGtmqyFSDWolB7nAtUfUDWR3Qp4yN1qdVz8cwxvvyKs4IH1WkTjAcJIRrQn root@ip-172-31-16-155.us-west-1.compute.internal"
  #"${file("~/.ssh/id_rsa.pub")}" 
}

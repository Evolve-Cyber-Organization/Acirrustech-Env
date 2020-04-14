output "security_group" {
  value = "${aws_security_group.secure_bastion.name}"
}

output "security_group_id" {
  value = "${aws_security_group.secure_bastion.id}"
}

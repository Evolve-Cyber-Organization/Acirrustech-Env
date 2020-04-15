output "Password" {
 value = "p@ssw4rd"
}
output "Domain" {
 value = "${aws_route53_record.r1soft.name}"
}
output "User" {
 value = "admin"
}
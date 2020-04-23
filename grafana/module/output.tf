output "domain" {
  value = " http://${aws_route53_record.grafana.name}"
}
output "username"{
  value = "admin"
}
output "password"{
  value = "admin"
}
output "To_Do"{
  value = "Please reset username and password"
}

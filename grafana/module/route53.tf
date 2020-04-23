resource "aws_route53_record" "grafana" {
  zone_id = "${var.zone_id}"
  name    = "qa.${var.domain}"   
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.grafana.public_ip}"]
}

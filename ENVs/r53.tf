resource "aws_route53_record" "bar" {
  zone_id = "Z32OHGRMBVZ9LR"
  name    = "dev.acirrustech.com"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_elb.bar.dns_name}"]
}
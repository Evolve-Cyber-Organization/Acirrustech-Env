resource "aws_route53_record" "wordpress" {
  zone_id = "Z32OHGRMBVZ9LR"
  name    = "wordpress.acirrustech.com"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_elb.wordpress.dns_name}"]

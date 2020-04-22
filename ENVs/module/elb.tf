module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 3.0"

  # name = "my-alb"

  #  load_balancer_type = "application"
   load_balancer_name = "my-alb"

  vpc_id             = "vpc-67dd1f1f",
  subnets            = ["subnet-a33d13f9", "subnet-250e515c"],
  security_groups    = ["sg-5dc4992f", "sg-0689645e075fd8fe9"]

  # access_logs = {
  #   bucket = "my-alb-logs"
  # }

  target_groups = [
    {
      name_prefix      = "default"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }

}
# resource "aws_autoscaling_attachment" "wordpress" {   
#     autoscaling_group_name = "${module.dev.this_autoscaling_group_id}"    
#     elb                    = "${aws_elb.wordpress.name}"

# }
# }


# # Create a new load balancer attachment
# resource "aws_autoscaling_attachment" "example-with-elb" {
#   autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
#   elb                    = "${alb.example-with-elb.id}"
# }

# # Create a new load balancer attachment
# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
#   elb                    = "${aws_elb.bar.id}"
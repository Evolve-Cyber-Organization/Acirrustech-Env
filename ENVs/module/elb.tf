module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 3.0"

  # name = "my-alb"

  #  load_balancer_type = "application"
   load_balancer_name = "my-alb"

  vpc_id             = "${var.VPC}",
  subnets            = [
                               "${var.Subnet1}",      
                               "${var.Subnet2}",
                               "${var.Subnet3}"

  ],
  security_groups    = ["${var.security_group}"]

  access_logs = {
    bucket = "team1-logs1"
  }

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

# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "alb" {
  autoscaling_group_name = "example-with-elb"
  elb                    = "my-alb"
}
# }
# # # Create a new load balancer attachment
# # resource "aws_autoscaling_attachment" "asg_attachment_bar" {
# #   autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
# #   elb                    = "${aws_elb.bar.id}"

# }
# # resource "aws_autoscaling_attachment" "wordpress" {   
# #     autoscaling_group_name = "${module.dev.this_autoscaling_group_id}"    
# #     elb                    = "${aws_elb.wordpress.name}"

# # }
# # }
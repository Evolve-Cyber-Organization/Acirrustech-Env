# Create a new load balancer
resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

  # access_logs {
  #   bucket        = "team1-bucket1"
  #   bucket_prefix = "bar"
  #   interval      = 60
  # }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }



  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

   https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS:443/"
      certificate_arn    = "arn:aws:acm:us-west-2:713287746880:certificate/bb493896-560e-4864-8719-25c2058089f3"
      target_group_index = 0
    }
  ]

  
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "foobar-terraform-elb"
  }
}


     resource "aws_autoscaling_attachment" "bar" {   
     autoscaling_group_name = "${module.asg.this_autoscaling_group_id}"    
     elb                    = "${aws_elb.bar.name}"
     }


# # Create a new load balancer attachment
# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = "example-asg-20200422174825144700000002 "
#   elb                    =  "foobar-terraform-elb "                              #"${aws_elb.bar.id}"
# }




# module "alb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 3.0"

#   # name = "my-alb"

#   #  load_balancer_type = "application"
#    load_balancer_name = "my-alb"

#   vpc_id             = "${var.VPC}",
#   subnets            = [
#                                "${var.Subnet1}",      
#                                "${var.Subnet2}",
#                                "${var.Subnet3}"

#   ],
#   security_groups    = ["${var.security_group}"]

#   access_logs = {
#     bucket = "team1-logs1"
#   }

#   target_groups = [
#     {
#       name_prefix      = "default"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#     }
# #   ]

 
  
#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     }
#   ]

#   tags = {
#     Environment = "Test"
#   }
# }

# # Create a new load balancer attachment
# resource "aws_autoscaling_attachment" "example-asg" {
#   autoscaling_group_name = "example-with-elb"
#   elb                    = "my-alb"
# }
# # }
# # # # Create a new load balancer attachment
# # # resource "aws_autoscaling_attachment" "asg_attachment_bar" {
# # #   autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
# # #   elb                    = "${aws_elb.bar.id}"

# # }
# # # resource "aws_autoscaling_attachment" "wordpress" {   
# # #     autoscaling_group_name = "${module.dev.this_autoscaling_group_id}"    
# # #     elb                    = "${aws_elb.wordpress.name}"

# # # }
# # # }




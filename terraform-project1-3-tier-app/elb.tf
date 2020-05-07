# Create a new load balancer
resource "aws_elb" "wordpress" {
  name               = "wordpress1"
  subnets             = ["subnet-07205b2f"]
                      
  security_groups = ["sg-00b7467feb8ff2fd3"]
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

  
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  
  tags = {
    Name = "foobar-terraform-elb"
  }
}

resource "aws_autoscaling_attachment" "wordpress" {   
    autoscaling_group_name = "${module.dev.this_autoscaling_group_id}"    
    elb                    = "${aws_elb.wordpress.name}"

}


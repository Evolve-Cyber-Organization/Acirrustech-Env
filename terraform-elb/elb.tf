# Create a new load balancer
resource "aws_elb" "wordpress" {
  name               = "wordpress1"
  subnets             = [
                               "${data.terraform_remote_state.dev.Subnet1}",     ## ???
                               "${data.terraform_remote_state.dev.Subnet2}",
                               "${data.terraform_remote_state.dev.Subnet3}",
                        ]
  security_groups = [
    "${data.terraform_remote_state.dev.sec_group_1}",
    "${data.terraform_remote_state.dev.sec_group_2}"
  ]
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


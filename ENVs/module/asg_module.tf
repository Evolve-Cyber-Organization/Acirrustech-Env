# resource "aws_instance" "dev" {
#     ami               = "${var.ami}"
#     #region            =  "${var.region}"
#     instance_type     = "t2.medium"
#     security_groups    = ["${var.sg_group}"]
#     key_name          = "${aws_key_pair.test_key.key_name}"
#     user_data         = "${file("userdata_file")}"
# }

# Below code creates the above instance in ASG 
######
module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  version = "~> 2.0"
  name = "example-with-elb"
  
  
  
  lc_name = "example-lc"

  image_id        = "${var.ami}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${var.security_group}"]
  # load_balancers  = ["my-alb"]                         ###??????


  # Auto scaling group
  asg_name                  = "example-asg"
  vpc_zone_identifier       = [
                               "${var.Subnet1}",      
                               "${var.Subnet2}",
                               "${var.Subnet3}"
                               
                               ]
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 6
  desired_capacity          = 3
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]
}
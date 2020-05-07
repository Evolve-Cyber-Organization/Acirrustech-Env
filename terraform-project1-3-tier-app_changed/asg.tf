# Creates ASG with launch configuration
#Gets centos AMI information

data "aws_ami" "amazon_ami" {
  most_recent = true

 #filter {
 #   name   = "name"
 #   values = ["2019-02-Recovery (No-LVM)-ACB-CentOS7-HVM-SRIOV_ENA"] 
 #     }

  #filter {
  #  name   = "virtualization-type"
  #  values = ["hvm"]
  #}

  owners = ["137112412989"] # Canonical

}
resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-0d6621c01e8c2de2c"
  instance_type = "t2.micro"
}


module "dev" {                                                  
name = "wordpress"
source = "terraform-aws-modules/autoscaling/aws"
version = "2.12.0"
  lc_name = "wordpress-lc"
  image_id        = "ami-0d6621c01e8c2de2c"
  key_name        = "lily"
  instance_type   = "t2.micro"
  associate_public_ip_address = true
  security_groups = ["sg-00b7467feb8ff2fd3"]
  

  # Auto scaling group
  asg_name                  = "wordpress-asg"
  vpc_zone_identifier       = ["subnet-07205b2f"]     ### ???
                              
  health_check_type         = "EC2"
  min_size                  = 3
  max_size                  = 48
  desired_capacity          = 3
  wait_for_capacity_timeout = 0
  user_data = "${file("./wordpress.sh")}"
  
  # "${file("wordpress.sh")}"

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

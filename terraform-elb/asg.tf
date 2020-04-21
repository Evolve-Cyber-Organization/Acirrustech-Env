# Creates ASG with launch configuration
#Gets ubuntu AMI information

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
}


module "dev" {                                                  
name = "wordpress"
source = "terraform-aws-modules/autoscaling/aws"
version = "2.12.0"

  # Launch configuration
  
  lc_name = "wordpress-lc"
  image_id        = "${data.aws_ami.ubuntu.id}"
  key_name        = "${aws_key_pair.team4.key_name}"
  instance_type   = "t2.micro"
  associate_public_ip_address = true
  security_groups =[
    
                    "${data.terraform_remote_state.dev.sec_group_1}",
                    "${data.terraform_remote_state.dev.sec_group_2}"
                  
                  ] 
  

  # Auto scaling group
  asg_name                  = "wordpress-asg"
  vpc_zone_identifier       = [
                               "${data.terraform_remote_state.dev.Subnet1}",      ### ???
                               "${data.terraform_remote_state.dev.Subnet2}",
                               "${data.terraform_remote_state.dev.Subnet3}",
                               ]
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

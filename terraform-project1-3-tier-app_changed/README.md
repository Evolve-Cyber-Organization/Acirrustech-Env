# This Repo is used to create a 3-tier-app infrastructure on AWS.   

# It will use the data_source.tf file to pull info from a pre-created VPC by Team-1, whose repo is 
# attached in the link below, from GitHub.
# We use teheir key to pull their VPC ID- Private Subnet ID -  Public Subnet ID - IGW
# Mysql Sec Group ID - Web Sec Group ID - IGW ID
# https://github.com/Taniusellu/team2-project-terraform.git



# It will use the database info from the Team-2 (the second team reads the team one's .tfstatefile too , 
# by using data_source.tf for their VPC info)
# https://github.com/Taniusellu/team2-project-terraform.git


# you need to have the following requirements for Terraform:

# required_version   = "~> 0.11.14"
# required_providers = "~> 2.55"
# required_providers = "~> 2.1"
# required_providers = "~> 2.2"

# you need to clone the repo:
# git clone  https://github.com/sezginmutlu/terraform-project1-3-tier-app.git

# Once the repo is cloned you can run the following commands to see the outputs and to create the 3-tier app, which uses the infor from team-1 and team-2

# source setenv.sh configurations/us-east-1/us-east-1.tfvars 
# terraform apply -var-file configurations/us-east-1/us-east-1.tfvars

<!-- Outputs:

IGW = igw-0fdfdc75e26cdf553
Private_Subnet1 = subnet-0ceb94787e34eae11
Private_Subnet2 = subnet-0ba74c429e0c151d7
Private_Subnet3 = subnet-0ca6029b3ca44ec5c
Reader_aws_rds_endpoint = Reader mysqldb-team2.cluster-ro-ckhudyx0jjty.us-east-1.rds.amazonaws.com
Subnet1 = subnet-0d3d91e79ddef4afb
Subnet2 = subnet-04dcb85f05c34d108
Subnet3 = subnet-0ea3e27c837e42b3d
Team1_Output_sec_group = sg-06b99f48d655e0118
VPC_ID = vpc-0773057c03e66eeb5
web_sec_group = sg-0241e0b9d7d8053b3
writer_aws_rds_endpoint = Writer mysqldb-team2.cluster-ckhudyx0jjty.us-east-1.rds.amazonaws.com -->




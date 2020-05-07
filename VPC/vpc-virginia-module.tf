module "vpc-virginia" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.53.0"
  
  name = "terraform-vpc-virginia"
  
  cidr = "16.0.0.0/16"

  azs            = ["us-east-1a", "us-east-1b"]
  public_subnets = ["16.0.1.0/24", "16.0.2.0/24"]
  private_subnets = ["16.0.101.0/24", "16.0.102.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true
   providers = {
    aws = "aws.virginia"
  }
}
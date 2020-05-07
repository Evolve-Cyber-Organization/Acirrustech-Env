module "vpc-ohio" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.53.0"

  name = "terraform-vpc-ohio"
  cidr = "198.0.0.0/16"

  azs            = ["us-east-2a", "us-east-2b"]
  public_subnets = ["198.0.1.0/24", "198.0.2.0/24"]
  private_subnets = ["198.0.101.0/24", "198.0.102.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true
  providers = {
    aws = "aws.ohio"
  }
}
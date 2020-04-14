terraform {
  backend "s3" {
    bucket = "environment-bucket"
    key    = "infrustructure/ec2/state"
    region = "us-west-2"
  }
}

terraform {
backend "s3" {
bucket = "terraform-project1-team4"
key = "team4/us-east-1/tools/dev/team4.tfstate"
region = "us-east-1"
  }
}

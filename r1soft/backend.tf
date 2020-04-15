terraform {
backend "s3" {
bucket = "r1soft-team4"
key = "r1soft/us-west-2/tools/dev/jenkins.tfstate"
region = "us-west-2"
  }
}

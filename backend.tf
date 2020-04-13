terraform {
backend "s3" {
bucket = "environment-bucket"
key = "application/us-west-2/state/dev/acirrustech.tfstate"
region = "us-west-2"
  }
}
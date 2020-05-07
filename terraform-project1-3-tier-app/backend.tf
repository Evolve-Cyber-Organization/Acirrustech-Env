terraform {
backend "s3" {
bucket = "three-tier-app"
key = "team1/us-west-2/tools/dev/team1.tfstate"
region = "us-west-2"
  }
}

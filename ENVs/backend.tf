terraform {
backend "s3" {
bucket = "team1-bucket1"
key = "team4/us-west-2/tools/dev/team4.tfstate"
region = "us-west-2"
  }
}

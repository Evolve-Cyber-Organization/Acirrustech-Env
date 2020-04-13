terraform {
backend "s3" {
bucket = "jenkins-class-yunus"
key = "application/us-west-2/state/dev/acirrustech.tfstate"
region = "us-east-1"
  }
}

# change the key 

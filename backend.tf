terraform {
backend "s3" {
bucket = "environmet-bucket"
key = "application/us-west-2/state/dev/acirrustech.tfstate"
region = "us-west-2"
  }
}

# change the key 

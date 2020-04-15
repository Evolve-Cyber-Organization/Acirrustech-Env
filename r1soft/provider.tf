provider "aws" {
    region = "${var.region}"
    
}

terraform {
  required_version = "~> 0.11.14"
  required_providers = "~> 2.51"
}
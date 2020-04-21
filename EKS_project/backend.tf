terraform {
backend "s3" {
bucket = "eks-terraform-team2-oregon"
key = "application/us-west-2/state/oregon/infrastructure.tfstate"
region = "us-west-2"
  }
}

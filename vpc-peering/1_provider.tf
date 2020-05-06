provider "aws" {
  #region="us-east-1"
  region="${var.region}"
  version="2.59"
  alias  = "peer"
}

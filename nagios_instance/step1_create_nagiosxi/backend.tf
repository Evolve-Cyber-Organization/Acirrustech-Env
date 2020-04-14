terraform {
 backend "s3" {
    bucket = "nagiosxi-project" 
    region = "us-west-1" 
    key    = ""
  }
}

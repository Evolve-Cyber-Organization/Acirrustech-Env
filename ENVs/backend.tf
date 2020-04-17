terraform {
    backend "s3" {
       bucket = "environment-bucket"
       key = "infrustructure"
       region = "us-west-2"
   }

}

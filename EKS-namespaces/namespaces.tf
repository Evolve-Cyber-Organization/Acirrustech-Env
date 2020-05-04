provider "aws" {
    region = "us-west-2"    
}


resource "null_resource" "login" {
  triggers = {
    always_run = "${timestamp()}"

  }

  provisioner "local-exec" {
    command = "kubectl create namesapce dev"
  }

  provisioner "local-exec" {
    command = "kubectl create namesapce qa"
  }

  provisioner "local-exec" {
    command = "kubectl create namesapce stage"
  }

  provisioner "local-exec" {
    command = "kubectl create namesapce prod"
  }
}



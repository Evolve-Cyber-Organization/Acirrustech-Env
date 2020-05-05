provider "aws" {
    region = "us-west-2"    
}


resource "null_resource" "login" {
  triggers = {
    always_run = "${timestamp()}"

  }

  provisioner "local-exec" {
    command = "kubectl create namespace dev"
  }

  provisioner "local-exec" {
    command = "kubectl create namespace qa"
  }

  provisioner "local-exec" {
    command = "kubectl create namespace stage"
  }

  provisioner "local-exec" {
    command = "kubectl create namespace prod"
  }
}



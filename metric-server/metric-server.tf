provider "aws" {
    region = "us-west-2"    
}


resource "null_resource" "login" {
  triggers = {
    always_run = "${timestamp()}"

  }

  provisioner "local-exec" {
    command = "kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml"
  }
}
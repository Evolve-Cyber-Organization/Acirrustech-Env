resource "null_resource" "login" {
    provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${var.cluster_name}"
    }
    provisioner "local-exec" {
    command = "/tmp/kubectl get nodes"
  }
}

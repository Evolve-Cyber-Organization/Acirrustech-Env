module "artemis_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "artemis-atakan2"
  deployment_endpoint    = "atakan-terraform.${var.eks_domain_name}"
  deployment_path        = "atakan"
  deployment_environment = "dev"

   template_custom_vars    = {
     docker_image           = "${var.docker_image_url}"
     docker_image_tag       = "${var.docker_image_version}"
  }
}
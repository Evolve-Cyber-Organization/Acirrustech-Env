module "artemis_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "prod-charts"
  deployment_endpoint    = "prod${var.eks_domain_name}"
  deployment_path        = "prod-charts"
  deployment_environment = "prod"
   template_custom_vars    = {
     docker_image           = "${var.docker_image_url}"
     docker_image_tag       = "${var.docker_image_version}"
  }
}
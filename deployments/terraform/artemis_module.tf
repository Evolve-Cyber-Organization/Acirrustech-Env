module "artemis_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "artemis-sezgin"
  deployment_endpoint    = "prod-chart.${var.eks_domain_name}"
  deployment_path        = "artmis-sezgin"
  deployment_environment = "dev"

   template_custom_vars    = {
     docker_image           = "${var.docker_image_url}"
     docker_image_tag       = "${var.docker_image_version}"
  }
}
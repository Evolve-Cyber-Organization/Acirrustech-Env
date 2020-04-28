module "artemis_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "artemis"
  deployment_endpoint    = "prod-chart.${var.eks_domain_name}"
  docker_image           = "${var.docker_image_url}"
  docker_image_tag       = "${var.docker_image_version}"
  deployment_path        = "artmis-test"
  deployment_environment = "dev"
}
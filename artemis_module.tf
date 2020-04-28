module "artemis_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "artemis"
  deployment_endpoint    = "prod-chart.${var.eks_domain_name}"
  docker_image_url           = "${var.docker_image}"
  docker_image_version       = "${var.docker_image_tag}"
  deployment_path        = "artmis-test"
  deployment_environment = "dev"
}
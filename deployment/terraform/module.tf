module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "safa-g-chart"
  deployment_environment = "dev"
  deployment_endpoint    = "safa--g.${var.domain_name}"
  deployment_path        = "safa-g-chart05"

  template_custom_vars    = {
     docker_image           = "${var.docker_image_url}"
     docker_image_tag       = "${var.docker_image_version}"
  }
}

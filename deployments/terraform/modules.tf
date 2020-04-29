module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "merve-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "merve.${var.domain_name}"
  deployment_path        = "merves-chart"

  template_custom_vars    = {
     docker_image           = "${var.docker_image_url}"
     docker_image_tag       = "${var.docker_image_version}"
  }
}

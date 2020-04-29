module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "olgaoj"
  deployment_environment = "qa"
  deployment_endpoint    = "test-t2.${var.domain_name}"
  deployment_path        = "olgaoj"

  template_custom_vars    = {
     docker_image           = "${var.docker_image_url}"
     docker_image_tag       = "${var.docker_image_version}"
  }
}

module "ingress_controller" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "ingress-controller"
  deployment_environment = "default"
  deployment_endpoint    = "ingress-controller.acirrustech.com"
  deployment_path        = "ingress-controller"

  # template_custom_vars   = {
  #   null_depends_on      = "${null_resource.cert_manager.id}"
  # }
}


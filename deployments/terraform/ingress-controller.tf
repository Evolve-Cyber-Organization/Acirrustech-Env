module "ingress_controller" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "ingress-controller"
  deployment_environment = "dev"
  deployment_endpoint    = "ingress-controller.acirrustech.com"
  deployment_path        = "ingress-controller"

 
}

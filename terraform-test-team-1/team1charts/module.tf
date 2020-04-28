module "chart" {
  source  = "fuchicorp/chart/helm"
  version = "0.0.3"
  # insert the 4 required variables here
deployment_name        = "artemis-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "artemis.acirrustech.com"
  deployment_path        = "artemis"

  template_custom_vars = {
    deployment_image = "nginx"
  }
}




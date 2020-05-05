module "grafana_deploy" {
  source                 = "fuchicorp/chart/helm"
  deployment_name        = "grafana-deploy"
  deployment_environment = "dev"
  deployment_endpoint    = "grafana.acirrustech.com"
  deployment_path        = "grafana"
}

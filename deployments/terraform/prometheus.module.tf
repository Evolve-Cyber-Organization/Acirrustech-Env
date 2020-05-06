module "prometheus_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "prometheus-deploy"
  deployment_environment = "qa"
  deployment_endpoint    = "prometheus.acirrustech.com"
  deployment_path        = "prometheus"
  
} 

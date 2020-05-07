module "prometheus_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "prometheus-deploy"
  deployment_environment = "dev"
  deployment_endpoint    = "prometheus.${var.domain_name}"
  deployment_path        = "prometheus"
  
 # template_custom_vars    = {
 #   null_depends_on       = "${null_resource.cert_manager.id}"
 # }
}

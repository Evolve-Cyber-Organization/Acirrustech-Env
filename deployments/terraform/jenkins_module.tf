module "jenkins_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "jenkins"
  deployment_endpoint    = "jenkins.${var.main_domain_name}"
  deployment_path        = "jenkins"
  deployment_environment = "test"
}
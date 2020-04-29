module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "artemis-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "gulmira-terraform.acirrustech.com"
  deployment_path        = "gulmira-example"
}

  


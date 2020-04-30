module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "liliia-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "devchart.acirrustech.com."
  deployment_path        = "lily"
}

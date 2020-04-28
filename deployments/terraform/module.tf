module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "example-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "example.acirrustech.com"
  deployment_path        = "example"
}

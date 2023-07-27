module "global_vars" {
  source          = "../global_vars"
}

provider "google" {
  credentials = module.global_vars.credentials
  project     = module.global_vars.project
  region      = module.global_vars.project_region
}

data "google_client_config" "provider" {}

provider "kubectl" {
  apply_retry_count      = 5
  host                   = "${data.terraform_remote_state.kubernetes.outputs.endpoint}"
  cluster_ca_certificate = data.terraform_remote_state.kubernetes.outputs.cluster_ca_certificate
  load_config_file       = false
  token                  = data.google_client_config.provider.access_token
}

provider "helm" {
  kubernetes {
    host                   = "${data.terraform_remote_state.kubernetes.outputs.endpoint}"
    client_certificate     = data.terraform_remote_state.kubernetes.outputs.client_certificate
    cluster_ca_certificate = data.terraform_remote_state.kubernetes.outputs.cluster_ca_certificate
    token                  = data.google_client_config.provider.access_token
  }
}
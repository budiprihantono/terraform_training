module "global_vars" {
  source          = "../global_vars"
}

provider "google" {
  credentials = module.global_vars.credentials
  project     = module.global_vars.project
  region      = module.global_vars.project_region
}
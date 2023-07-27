terraform {
  backend "gcs" {
    bucket      = "development-terraform"
    prefix      = "compute_state"
    credentials = "../example_service_account.json"
  }
}

data "terraform_remote_state" "networking" {
  backend       = "gcs"
  config        = {
    bucket      = "development-terraform"
    prefix      = "networking_state"
    credentials = "../example_service_account.json"
  }
}
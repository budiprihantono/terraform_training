terraform {
  backend "gcs" {
    bucket      = "development-terraform"
    prefix      = "cloud_dns_state"
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
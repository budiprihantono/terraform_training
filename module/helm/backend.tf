terraform {
  backend "gcs" {
    bucket      = "development-terraform"
    prefix      = "helm_state"
    credentials = "../example_service_account.json"
  }
}

data "terraform_remote_state" "kubernetes" {
  backend       = "gcs"
  config        = {
    bucket      = "development-terraform"
    prefix      = "kubernetes_state"
    credentials = "../example_service_account.json"
  }
}
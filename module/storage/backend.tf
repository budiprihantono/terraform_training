terraform {
  backend "gcs" {
    bucket      = "development-terraform"
    prefix      = "storage_state"
    credentials = "../example_service_account.json"
  }
}
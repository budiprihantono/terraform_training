terraform {
  backend "gcs" {
    bucket      = "development-terraform"
    prefix      = "networking_state"
    credentials = "../example_service_account.json"
  }
}
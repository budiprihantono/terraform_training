provider "google" {
  credentials = file("../example_service_account.json")
  project     = "devops-392511"
  region      = "asia-southeast2"
}


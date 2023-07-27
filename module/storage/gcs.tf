resource "google_storage_bucket" "development_terraform" {
  name          = "${module.global_vars.environment}-terraform"
  location      = module.global_vars.project_region
  storage_class = "STANDARD"
  force_destroy = true
  public_access_prevention = "enforced"

  cors {
    origin = ["*"]
    method = ["*"]
  }
}

# resource "google_storage_default_object_access_control" "development_terraform" {
#   bucket = google_storage_bucket.development_terraform.name
#   role   = "READER"
#   entity = "allUsers"
# }

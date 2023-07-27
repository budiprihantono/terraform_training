output "gcs_id" {
  description = "id of gcs"
  value       = google_storage_bucket.development_terraform.id
}

output "gcs_name" {
  description = "name of gcs"
  value       = google_storage_bucket.development_terraform.name
}
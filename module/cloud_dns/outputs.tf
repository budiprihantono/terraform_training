output "zone_name" {
  description = "zone_name"
  value       = google_dns_managed_zone.devdomain_cloud.dns_name
}

output "record_gateway" {
  description = "record_gateway"
  value       = google_dns_record_set.devdomain_cloud.name
}

resource "google_dns_record_set" "gateway" {
  name = "gateway.${google_dns_managed_zone.devdomain_cloud.dns_name}"
  type = "A"
  ttl  = 300
  managed_zone = google_dns_managed_zone.devdomain_cloud.name
  rrdatas = [data.terraform_remote_state.networking.outputs.ip_external_gke_neg_lb]
}
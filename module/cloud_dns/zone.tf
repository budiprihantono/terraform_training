resource "google_dns_managed_zone" "devdomain_cloud" {
  name              = "${module.global_vars.environment}-devdomain-cloud"
  dns_name          = var.domain_devdomain_cloud
  description       = "Example DNS zone"
  force_destroy     = true
}
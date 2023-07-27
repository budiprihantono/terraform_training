resource "google_compute_address" "bastion" {
  name         = "${module.global_vars.environment}-bastion"
  network_tier = "STANDARD"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "gke_neg_ip_lb" {
  name         = "gke-neg-ip-lb"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}
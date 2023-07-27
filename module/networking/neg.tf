data "google_compute_network_endpoint_group" "gke_zonal_network_endpoint_group_zone_a" {
  name = "ingress-nginx-80-neg"
  zone = module.global_vars.project_zone_a
}

data "google_compute_network_endpoint_group" "gke_zonal_network_endpoint_group_zone_b" {
  name = "ingress-nginx-80-neg"
  zone = module.global_vars.project_zone_b
}
data "google_compute_network_endpoint_group" "gke_zonal_network_endpoint_group_zone_c" {
  name = "ingress-nginx-80-neg"
  zone = module.global_vars.project_zone_c
}
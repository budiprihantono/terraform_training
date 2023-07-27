resource "google_compute_network" "vpc" {
  name                    = "${module.global_vars.environment}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_vpc" {
  name          = "${module.global_vars.environment}-subnet-vpc"
  ip_cidr_range = var.subnet_vpc
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "subnet_vpc_gke" {
  name          = "${module.global_vars.environment}-subnet-vpc-gke"
  ip_cidr_range = var.subnet_vpc_gke
  network       = google_compute_network.vpc.id
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "subnet_vpc" {
  description = "id subnet vpc"
  value       = google_compute_subnetwork.subnet_vpc.id
}

output "subnet_vpc_gke" {
  description = "id subnet vpc gke"
  value       = google_compute_subnetwork.subnet_vpc_gke.id
}

output "name_subnet_vpc" {
  description = "name_subnet_vpc"
  value       = google_compute_subnetwork.subnet_vpc.name
}

output "name_subnet_vpc_gke" {
  description = "name_subnet_vpc_gke"
  value       = google_compute_subnetwork.subnet_vpc_gke.name
}

output "ip_cidr_range_subnet_vpc" {
  description = "ip_cidr_range_subnet_vpc"
  value       = google_compute_subnetwork.subnet_vpc.ip_cidr_range
}

output "ip_cidr_range_subnet_vpc_gke" {
  description = "ip_cidr_range_subnet_vpc_gke"
  value       = google_compute_subnetwork.subnet_vpc_gke.ip_cidr_range
}

output "ip_external_bastion" {
  description = "ip_external_bastion"
  value       = google_compute_address.bastion.address
}

output "ip_external_gke_neg_lb" {
  description = "ip_external_gke_neg_lb"
  value       = google_compute_global_address.gke_neg_ip_lb.address
}

output "firewall_ssh_name" {
  description = "firewall_ssh_name"
  value       = google_compute_firewall.ssh.name
}

output "firewall_openvpn_name" {
  description = "firewall_openvpn_name"
  value       = google_compute_firewall.openvpn.name
}
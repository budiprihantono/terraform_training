resource "google_compute_firewall" "ssh" {
  name          = "ssh"
  network       = google_compute_network.vpc.id
  target_tags   = ["ssh"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "openvpn" {
  name          = "openvpn"
  network       = google_compute_network.vpc.id
  target_tags   = ["openvpn"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }
}

resource "google_compute_firewall" "mongodb" {
  name          = "mongodb"
  network       = google_compute_network.vpc.id
  target_tags   = ["mongodb"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
}

# resource "google_compute_firewall" "gke_master_node" {
#   name          = "gke-master-node"
#   network       = google_compute_network.vpc.id
#   target_tags   = [google_container_cluster.dev_cloud_cluster.name]
#   source_ranges = [var.interal_endpoint_access_gke]

#   allow {
#     protocol = "tcp"
#     ports    = ["8443"]
#   }
# }

resource "google_compute_firewall" "gke_neg_backend_health_check_allow" {
  name    = "gke-neg-allow-health-check"
  network = google_compute_network.vpc.id
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}

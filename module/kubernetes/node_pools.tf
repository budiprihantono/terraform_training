resource "google_container_node_pool" "development_spot" {
  name       = "${module.global_vars.environment}-spot"
  cluster    = google_container_cluster.development_cluster.name
  node_count = 1
  location   = module.global_vars.project_region

  node_config {
    image_type   = "ubuntu_containerd"
    disk_size_gb = 30
    disk_type    = "pd-standard"
    machine_type = "e2-small"
    spot         = true

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke_service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
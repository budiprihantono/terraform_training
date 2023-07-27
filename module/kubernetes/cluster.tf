resource "google_service_account" "gke_service_account" {
  account_id   = "gke-service-account-id"
  display_name = "GKE Service Account"
}

resource "google_container_cluster" "development_cluster" {
  name               = "${module.global_vars.environment}-cluster"
  location           = module.global_vars.project_region
  min_master_version = var.gke_min_master_version
  network            = data.terraform_remote_state.networking.outputs.vpc_id
  subnetwork         = data.terraform_remote_state.networking.outputs.subnet_vpc
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  
  release_channel {
    channel = "STABLE"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.interal_endpoint_access_gke
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = data.terraform_remote_state.networking.outputs.ip_cidr_range_subnet_vpc
      display_name = data.terraform_remote_state.networking.outputs.name_subnet_vpc
    }
    cidr_blocks {
      cidr_block   = data.terraform_remote_state.networking.outputs.ip_cidr_range_subnet_vpc_gke
      display_name = data.terraform_remote_state.networking.outputs.name_subnet_vpc_gke
    }
  }

  ip_allocation_policy {
    // Enable IP alias
  }

#   node_config {
#     disk_size_gb = 30
#     spot         = true
#   }
}
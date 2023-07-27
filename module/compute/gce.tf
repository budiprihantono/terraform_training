resource "google_compute_project_metadata_item" "ssh_keys" {
  key   = "ssh-keys"
  value = "ubuntu:${var.ssh_public_key}"
}

resource "google_compute_instance" "bastion" {
  name         = "${module.global_vars.environment}-bastion"
  machine_type = "e2-micro"
  zone         = module.global_vars.project_zone_a
  allow_stopping_for_update = true
  # Set a custom hostname below

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20220810"
      type  = "pd-standard"
      size  = 20
    }
  }

  network_interface {
    network    = data.terraform_remote_state.networking.outputs.vpc_id
    subnetwork = data.terraform_remote_state.networking.outputs.subnet_vpc
    access_config {
      nat_ip       = data.terraform_remote_state.networking.outputs.ip_external_bastion
      network_tier = "STANDARD"
    }
  }

  tags = ["${data.terraform_remote_state.networking.outputs.firewall_ssh_name}","${data.terraform_remote_state.networking.outputs.firewall_openvpn_name}"]
}

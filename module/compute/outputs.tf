output "compute_bastion" {
  description = "compute_bastion"
  value       = google_compute_instance.bastion.id
}
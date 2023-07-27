variable "gke_min_master_version" {
  description = "gke_min_master_version"
  type        = string
  default     = "1.26.5-gke.1200"
}

variable "interal_endpoint_access_gke" {
  description = "internal endpoint to access GKE"
  type        = string
  default     = "192.168.100.0/28"
}
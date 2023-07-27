variable "credentials" {
  description = "credentials"
  type        = string
  default     = "../example_service_account.json"
}

variable "project" {
  description = "project"
  type        = string
  default     = "devops-392511"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "development"
}

variable "project_region" {
  description = "Project Region"
  type        = string
  default     = "asia-southeast2"
}

variable "project_zone_a" {
  description = "Project Zone"
  type        = string
  default     = "asia-southeast2-a"
}

variable "project_zone_b" {
  description = "Project Zone"
  type        = string
  default     = "asia-southeast2-b"
}

variable "project_zone_c" {
  description = "Project Zone"
  type        = string
  default     = "asia-southeast2-c"
}
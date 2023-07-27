
variable "subnet_vpc" {
  description = "Subnet For VM"
  type        = string
  default     = "10.10.0.0/24"
}

variable "subnet_vpc_gke" {
  description = "Subnet For GKE"
  type        = string
  default     = "10.20.0.0/24"
}

variable "interal_endpoint_access_gke" {
  description = "internal endpoint to access GKE"
  type        = string
  default     = "192.168.100.0/28"
}


variable "global_ip_name" {
  default = "global-static-ip-for-negs"
}
variable "forwarding_rule_name" {
  default = "global-neg-gke-lb"
}


# variable "sit_db_password_mysql" {
#   description = "SIT MySQL root password"
#   type        = string
#   sensitive   = true
# }

# variable "sit_db_password_mysql_microservices" {
#   description = "SIT MySQL microservices password"
#   type        = string
#   sensitive   = true
# }

# variable "sit_db_password_mysql_microservices_log" {
#   description = "SIT MySQL microservices_log password"
#   type        = string
#   sensitive   = true
# }

# variable "sit_db_password_mysql_support" {
#   description = "SIT MySQL support password"
#   type        = string
#   sensitive   = true
# }

# variable "uat_db_password_mysql" {
#   description = "UAT MySQL root password"
#   type        = string
#   sensitive   = true
# }

# variable "sit_db_password_mongodb" {
#   description = "SIT MongoDB root password"
#   type        = string
#   sensitive   = true
# }

# variable "uat_db_password_mongodb" {
#   description = "UAT MongoDB root password"
#   type        = string
#   sensitive   = true
# }

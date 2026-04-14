variable "project_id" {
  description = "Target GCP project ID."
  type        = string
}

variable "region" {
  description = "Primary GCP region for the GKE cluster."
  type        = string
}

variable "prefix" {
  description = "Common resource naming prefix."
  type        = string
}

variable "network_self_link" {
  description = "VPC self link from the core remote state."
  type        = string
}

variable "subnetwork_self_link" {
  description = "Subnetwork self link from the core remote state."
  type        = string
}

variable "pods_range_name" {
  description = "Secondary range name used for pods."
  type        = string
}

variable "services_range_name" {
  description = "Secondary range name used for services."
  type        = string
}

variable "release_channel" {
  description = "GKE release channel."
  type        = string
}

variable "master_ipv4_cidr" {
  description = "CIDR block reserved for the private GKE control plane."
  type        = string
}

variable "authorized_cidr" {
  description = "CIDR allowed to access the GKE control plane."
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for GKE nodes."
  type        = string
}

variable "node_disk_size_gb" {
  description = "Boot disk size for GKE nodes."
  type        = number
}

variable "min_node_count" {
  description = "Minimum node count for autoscaling."
  type        = number
}

variable "max_node_count" {
  description = "Maximum node count for autoscaling."
  type        = number
}

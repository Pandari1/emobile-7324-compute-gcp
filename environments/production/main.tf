terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.30"
    }
  }

  backend "gcs" {}
}

provider "google" {
  project = var.project_id
  region  = var.region
}

data "terraform_remote_state" "core" {
  backend = "gcs"

  config = {
    bucket = var.core_state_bucket
    prefix = var.core_state_prefix
  }
}

module "gke_private" {
  source = "../../modules/gke_private"

  project_id           = var.project_id
  region               = var.region
  prefix               = var.prefix
  network_self_link    = data.terraform_remote_state.core.outputs.vpc_self_link
  subnetwork_self_link = data.terraform_remote_state.core.outputs.subnet_self_link
  pods_range_name      = data.terraform_remote_state.core.outputs.pods_range_name
  services_range_name  = data.terraform_remote_state.core.outputs.services_range_name
  release_channel      = var.release_channel
  master_ipv4_cidr     = var.master_ipv4_cidr
  authorized_cidr      = var.authorized_cidr
  node_machine_type    = var.node_machine_type
  node_disk_size_gb    = var.node_disk_size_gb
  min_node_count       = var.min_node_count
  max_node_count       = var.max_node_count
}

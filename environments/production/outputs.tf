output "cluster_name" {
  value = module.gke_private.cluster_name
}

output "cluster_location" {
  value = module.gke_private.cluster_location
}

output "gke_node_service_account_email" {
  value = module.gke_private.gke_node_service_account_email
}

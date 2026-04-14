output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

output "gke_node_service_account_email" {
  value = google_service_account.gke_nodes.email
}

output "kubeconfig" {
  #value = google_container_cluster.my_cluster.kubeconfig[0].raw_config
  value = google_container_cluster.my_cluster
}
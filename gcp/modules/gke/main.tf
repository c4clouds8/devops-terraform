
#Data block to fetch vpc info
data "google_compute_network" "vpc-network" {
  name = "devops-vpc"
}

#Data block to fetch subnetwork info
data "google_compute_subnetwork" "vpc-subnetwork" {
  name   = "devops-vpc-subnet-1"
  region = "us-central1"
}

resource "google_service_account" "sa" {
  account_id   = "gke-sa"
  display_name = "gke-sa"
  project      = var.project_id
}

resource "google_container_cluster" "my_cluster" {
  deletion_protection = false
  initial_node_count       = 1  
  name     = var.cluster_name
  #location = var.zone
  node_locations =var.zone
  network            = data.google_compute_network.vpc-network.id
  subnetwork         = data.google_compute_subnetwork.vpc-subnetwork.id
  
# Specify the desired Kubernetes version for the cluster
  min_master_version = "1.27.3-gke.100"  # Specify the desired Kubernetes version here
  node_version       = "1.27.3-gke.100"  # Specify the desired node version here
  cluster_autoscaling {
    enabled = false
  }

  # Enable the Kubernetes API
  remove_default_node_pool = true

  # Enable network policy for the cluster
  network_policy {
    enabled = true
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.my_cluster.id
  node_count = 2
  node_locations = var.zone

  node_config {
    disk_size_gb = 20
    disk_type = "pd-standard"
    preemptible  = true
    machine_type = "e2-medium"
   
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}



resource "google_compute_network" "vpc_network" {
  name = "devops-vpc"
  auto_create_subnetworks = false
  project = "devops-102023"
}
resource "google_compute_subnetwork" "subnet-1" {
  name          = "devops-vpc-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_subnetwork" "subnet-2" {
  name          = "devops-vpc-subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_firewall" "my-firewall" {
  name = "allow-all"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "all"
  }
  source_ranges= ["0.0.0.0/0"]
}
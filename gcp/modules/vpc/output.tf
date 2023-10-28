output "vpc_network_id" {
  description = "ID of the created VPC network"
  value       = google_compute_network.vpc_network
}

output "subnet_1_id" {
  description = "ID of devops-vpc-subnet-1"
  value       = google_compute_subnetwork.subnet-1
}

output "subnet_2_id" {
  description = "ID of devops-vpc-subnet-2"
  value       = google_compute_subnetwork.subnet-2
}

output "firewall_id" {
  description = "ID of the created firewall rule"
  value       = google_compute_firewall.my-firewall
}

variable "credentials_file" {
  description = "Path to the GCP service account key file"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

#Variables for GKE Cluster
# variable "credentials_file" {
#   description = "Path to the GCP service account key file"
#   type        = string
# }


variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

 variable "location" {}

variable "zone" {
  description = "Define zone name" 
  type = set(string)
}

# variable "service_account_email" {
#   description = "Email address of the service account"
#   type        = string
#   default = "c4clouds8@gmail.com"
# }


variable "vm_name" {
  description = "Provide Name to Virtual Machine"
  #type = list(string)
  type = list(object({
    name       = string
    subnetwork = string
    image = string
  }))
}

variable "machine_type" {
  description = "Define size of Virtual Machine"
}

variable "zone" {
  description = "Define zone name" 
  type = set(string)
}

# variable "image" {
#   description = "define Image"
# }

variable "network_details" {
  type =object({
        network=  string,
        subnetwork = string 
    })
  default = {
    network = "devops-vpc"
    subnetwork = "devops-vpc-subnet-1"
  }  
}

#Variables for GKE Cluster
# variable "credentials_file" {
#   description = "Path to the GCP service account key file"
#   type        = string
# }

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "location" {}


# variable "service_account_email" {
#   description = "Email address of the service account"
#   type        = string
#   default = "c4clouds8@gmail.com"
# }

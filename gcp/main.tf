#Create VPC
module "vpc" {
    source = "./modules/vpc"
    
}

# # Create Virtual Machine
# module "virtual_machine" {
#   source = "./modules/virtual_machine"
#   #image = var.image
#   vm_name = var.vm_name
#   zone = var.zone
#   machine_type = var.machine_type
#   # network_details = {
#   #   network = var.network_details.network
#   #   subnetwork = var.network_details.subnetwork
#   # }
#   depends_on = [ module.create_vpc ]
# }

#Create GKE Cluster
module "gke" {
  credentials_file = "gcp-key.json"
  project_id = "devops-102023"
  source = "./modules/gke"
  region          = var.region
  location = var.location
  zone=var.zone
  cluster_name    = var.cluster_name
  depends_on = [ module.vpc ]
}


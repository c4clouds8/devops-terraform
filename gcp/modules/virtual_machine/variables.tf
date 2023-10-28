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


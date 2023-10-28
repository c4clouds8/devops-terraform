# output "vm_ip" {
#   #value = [for iface in module.virtual_machine.vm_details : iface.net_ip]
#   value = "${join(" ", module.virtual_machine.vm_details.*.network_interface.0.access_config.0.nat_ip)}"         
# }


# output "vm_details" {
#   value = [
#     for instance in  module.virtual_machine.vm_details :
#     {
#       vm_name      = instance.name
#       machine_type = instance.machine_type
#       zone         = instance.zone
#       image        = instance.boot_disk[0].initialize_params[0].image
#       network_details = {
#         network    = instance.network_interface[0].network
#         subnetwork = instance.network_interface[0].subnetwork
#         # Add other network details if needed
#       }
#     }
#   ]
# }

# output "vm_details"{
#   value = [ for i in module.virtual_machine.vm_details :
#         { 
#           name = i[*]
#           }
#   ]
# }

output "kubeconfig" {
  value = module.gke.kubeconfig
  sensitive = true
}

output "vpc_network_id" {
  value = module.vpc.vpc_network_id.id
}

output "subnet_1_id" {
  value = module.vpc.subnet_1_id.id
}

output "subnet_2_id" {
  value = module.vpc.subnet_2_id.id
}
#########################
## GCP Linux VM - Main ##
#########################

# # Terraform plugin for creating random ids
# resource "random_id" "instance_id" {
#   byte_length = 4
# }

# Bootstrapping Script to Install Apache
# data "template_file" "linux-metadata" {
#   template = <<EOF
# sudo yum update -y;
# sudo yum install httpd -y;
# sudo systemctl start httpd;
# sudo systemctl enable httpd;
# sudo useradd devops;
# sudo echo "devops ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/devops;
# EOF
# }

# Create VM

resource "google_compute_instance" "vm_instance_public" {
  count        = length(var.vm_name)
  name         = var.vm_name[count.index].name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.vm_name[count.index].image #var.image
    }
  }

  network_interface {
    network    = var.network_details.network
    #subnetwork = var.network_details.subnetwork
    subnetwork = var.vm_name[count.index].subnetwork

    access_config {
    }
  }

  metadata = {
    ssh-keys = "devops:${file("~/.ssh/id_rsa.pub")}"
  }

  # provisioner "remote-exec" {
  #   connection {
  #     host        = element(google_compute_instance.vm_instance_public[*].network_interface[0].access_config[0].nat_ip, count.index)
  #     type        = "ssh"
  #     user        = "devops"
  #     timeout     = "60s"
  #     private_key = file("~/.ssh/id_rsa")
  #   }
  #   inline = [
  #     data.template_file.linux-metadata.rendered,
  #   ]
  # }
}
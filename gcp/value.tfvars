vm_name=[
  {"name": "dev-vm1", "subnetwork": "devops-vpc-subnet-1", "image": "centos-7"},
  {"name": "dev-vm2", "subnetwork": "devops-vpc-subnet-1", "image": "centos-7"},
  {"name": "dev-vm3", "subnetwork": "devops-vpc-subnet-2", "image": "centos-7" }
]
machine_type="e2-medium"
zone=["us-central1-c"]
region = "us-central1"
location = "us-central1"
image="centos-7"
network_details = {
  network = "devops-vpc",
  subnetwork = "devops-vpc-subnet-1"
}

cluster_name="devops-k8s"
project_id="devops-102023"
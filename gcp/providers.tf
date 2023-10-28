terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.1.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "devops-102023"
  region  = "us-west1"
  zone    = "us-west1-a"
  credentials = "gcp-key.json"
}
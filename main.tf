provider "google" {
  zone    = var.zone
  region  = var.region
  project = var.project_id
}

module "instances" {
  source = "./modules/instances"
}

module "storage" {
  source = "./modules/storage"
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-198125"
    prefix  = "terraform/state"
  }
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "6.0.0"

    project_id   = var.project_id
    network_name = "tf-vpc-522605"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.region
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = var.region
        }
    ]
}
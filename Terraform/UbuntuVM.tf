variable "project_id" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}

provider "google" {
  credentials = file("credentials.json")
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "my_instance" {
  name         = var.vm_name
  machine_type = "custom-6-20480"
  zone         = var.zone

  boot_disk {
    initialize_params {
      size = "100"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    "google-compute-default-allow-http"  = "true"
    "google-compute-default-allow-https" = "true"
  }
}

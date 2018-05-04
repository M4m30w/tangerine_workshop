variable "billing_account" {}
variable "org_id" {}

provider "google" {
  project = "${var.project_id}"
  region  = "${var.region_name}"
}

##Project

# resource "google_project" "project" {
#   name    = "${var.project_name}"
#   project_id      = "${var.project_id}"
#   billing_account = "${var.billing_account}"
#   org_id          = "${var.org_id}"
# }

##Compute Engine

resource "google_compute_instance" "default" {
  project      = "${var.project_id}"
  zone         = "${var.region_zone}"
  name         = "${var.instance_name}"
  machine_type = "${var.type}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network       = "${var.network}"
    access_config = {}
  }
}



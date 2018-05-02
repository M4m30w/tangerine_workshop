variable "project_name" {}
variable "billing_account" {}
variable "org_id" {}
variable "region" {}

provider "google" {
  region = "${var.region}"
}
##Project
#resource "random_id": Project IDs must be unique. Generate a random one prefixed by the desired project ID.
resource "random_id" "id" {
  byte_length = 4
  prefix      = "${var.project_name}-"
}

resource "google_project" "project" {
  name            = "${var.project_name}"
  project_id      = "${random_id.id.hex}"
  billing_account = "${var.billing_account}"
  org_id          = "${var.org_id}"
}

resource "google_project_services" "project" {
  project = "${google_project.project.project_id}"

  services = [
    "compute.googleapis.com",
  ]
}

##Compute Engine
#Data resource used to lookup available Compute Engine zones, bound to the desired region. Avoids hard-coding of zone names.
data "google_compute_zones" "available" {}

resource "google_compute_instance" "default" {
  project      = "${google_project_services.project.project}"
  zone         = "${data.google_compute_zones.available.names[0]}"
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network       = "${var.network_name}"
    access_config = {}
  }
}

metadata {
    ssh-keys = "root:${file("${var.public_key_path}")}"
  }

  provisioner "file" {
    source      = "${var.install_script_src_path}"
    destination = "${var.install_script_dest_path}"

    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${file("${var.private_key_path}")}"
      agent       = false
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${file("${var.private_key_path}")}"
      agent       = false
    }

    inline = [
      "chmod +x ${var.install_script_dest_path}",
      "sudo ${var.install_script_dest_path} ${count.index}",
    ]
  }
variable "region" {
  default = "asia-southeast1"
}

variable "region_zone" {
  default = "asia-southeast1-a"
}

variable "project_name" {
  description = "description The ID of the Google Cloud project"
  default = " "
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/Terraform.json"
}

variable "instance_name" {
  default = " "
}

variable "machine_type" {
  default = "f1-micro"
} 

variable "instance_image" {
  default = "centos-6"
}

variable "network_name" {
  default = " "
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/gcloud_id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/gcloud_id_rsa"
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}

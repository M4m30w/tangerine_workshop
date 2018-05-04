variable "region_name" {
  default = "asia-southeast1"
}

variable "region_zone" {
  default = "asia-southeast1-b"
}

variable "project_name" {
  description = "The name of the Google Cloud project"
  default = "meow-lab01"
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
  default = "meow-hp01"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "/Users/chanatinatnakchang/.config/gcloud/tangerine-terraform.json"
}

variable "instance_name" {
  description = "The name of the Compute Engine"
  default = "meow-test"
}

variable "image" {
  description = "The family name of the Compute Engine image"
  default = "centos-6"
}

variable "type" {
  description = "The name of the Compute Engine machine type"
  default = "f1-micro"
}

variable "network" {
  description = "The name of the network interface"
  default = "default" 
}
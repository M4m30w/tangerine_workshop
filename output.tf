output "project_id" {
  value = "${google_project.project.project_id}"
}

#output "instance_id": The self_link is output to make it easier to ssh into the instance after Terraform completes.
output "instance_id" {
  value = "${google_compute_instance.default.self_link}"
}
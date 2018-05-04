output "instance_id" {
  value = "${google_compute_instance.default.self_link}"
}

output "project_id" {
  value = "${google_project.project.project_id}"
}




###############################################################################
# Outputs - Deployment ke baad ye details milengi
###############################################################################

output "notebook_url" {
  description = "Jupyter Notebook ka access URL (browser mein khol sakte hain)"
  value       = google_workbench_instance.jupyter.proxy_uri
}

output "instance_name" {
  description = "Workbench instance ka naam"
  value       = google_workbench_instance.jupyter.name
}

output "instance_id" {
  description = "Workbench instance ka full resource ID"
  value       = google_workbench_instance.jupyter.id
}

output "location" {
  description = "Notebook ki location/zone"
  value       = google_workbench_instance.jupyter.location
}

output "machine_type" {
  description = "Configured machine type"
  value       = var.machine_type
}

output "console_link" {
  description = "GCP Console mein notebook dekhne ka direct link"
  value       = "https://console.cloud.google.com/vertex-ai/workbench/instances?project=${var.project_id}"
}

output "deployment_summary" {
  description = "Deployment summary"
  value = {
    name          = google_workbench_instance.jupyter.name
    location      = google_workbench_instance.jupyter.location
    machine_type  = var.machine_type
    gpu_enabled   = var.enable_gpu
    owner         = var.owner_email
    environment   = var.environment
    url           = google_workbench_instance.jupyter.proxy_uri
  }
}

###############################################################################
# Module: Jupyter Notebook (Vertex AI Workbench)
# Version: 1.0.0
# Description: Managed Jupyter notebook for data science teams
# Author: AI Platform Team
###############################################################################

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

###############################################################################
# Required APIs - automatically enabled
###############################################################################
resource "google_project_service" "required_apis" {
  for_each = toset([
    "notebooks.googleapis.com",
    "compute.googleapis.com",
    "aiplatform.googleapis.com"
  ])

  project            = var.project_id
  service            = each.key
  disable_on_destroy = false
}

###############################################################################
# Vertex AI Workbench Instance (managed Jupyter)
###############################################################################
resource "google_workbench_instance" "jupyter" {
  name     = var.notebook_name
  location = "${var.region}-a"
  project  = var.project_id

  gce_setup {
    machine_type = var.machine_type

    # Pre-built Deep Learning VM image
    vm_image {
      project = "cloud-notebooks-managed"
      family  = "workbench-instances"
    }

    # GPU optionally attached
    dynamic "accelerator_configs" {
      for_each = var.enable_gpu ? [1] : []
      content {
        type       = var.gpu_type
        core_count = var.gpu_count
      }
    }

    # Boot disk
    boot_disk {
      disk_size_gb = var.disk_size_gb
      disk_type    = "PD_SSD"
    }

    # Metadata
    metadata = {
      "owner"                 = var.owner_email
      "managed-by"            = "ai-service-catalog"
      "idle-timeout-seconds"  = tostring(var.idle_timeout_seconds)
    }

    # Public IP control
    disable_public_ip = var.disable_public_ip
  }

  # Standard labels
  labels = {
    environment = var.environment
    managed_by  = "service-catalog"
    team        = var.team_name
    service     = "jupyter-notebook"
  }

  depends_on = [
    google_project_service.required_apis
  ]
}

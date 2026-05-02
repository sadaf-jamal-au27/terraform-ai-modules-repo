###############################################################################
# Example: Jupyter Notebook ko apne project mein deploy karein
# Ye file aap kisi bhi project mein use kar sakti hain
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

provider "google" {
  project = var.project_id
  region  = var.region
}

###############################################################################
# Catalog se Jupyter Notebook module use karein
# Source: GitHub repo (versioned)
###############################################################################
module "jupyter_notebook" {
  # IMPORTANT: Apne GitHub username/org se replace karein
  source = "git::https://github.com/YOUR_GITHUB_USERNAME/terraform-ai-modules-repo.git//modules/jupyter-notebook?ref=v1.0.0"

  # Required inputs
  project_id    = var.project_id
  notebook_name = var.notebook_name
  owner_email   = var.owner_email

  # Optional inputs (defaults already set)
  region        = var.region
  machine_type  = var.machine_type
  team_name     = var.team_name
  environment   = var.environment
  enable_gpu    = var.enable_gpu
}

###############################################################################
# Outputs - Module ke outputs ko surface karein
###############################################################################
output "notebook_url" {
  value       = module.jupyter_notebook.notebook_url
  description = "Browser mein khol kar Jupyter access karein"
}

output "console_link" {
  value       = module.jupyter_notebook.console_link
  description = "GCP Console mein notebook dekhne ka link"
}

output "summary" {
  value       = module.jupyter_notebook.deployment_summary
  description = "Deployment summary"
}

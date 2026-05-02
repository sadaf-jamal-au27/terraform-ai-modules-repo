###############################################################################
# Example deployment ke variables
###############################################################################

variable "project_id" {
  description = "GCP Project ID jahan deploy karna hai"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "notebook_name" {
  description = "Notebook ka unique naam"
  type        = string
  default     = "my-jupyter-notebook"
}

variable "owner_email" {
  description = "Owner email"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "n1-standard-4"
}

variable "team_name" {
  description = "Team name"
  type        = string
  default     = "data-science"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "enable_gpu" {
  description = "GPU enable karna hai? (default: false for cost)"
  type        = bool
  default     = false
}

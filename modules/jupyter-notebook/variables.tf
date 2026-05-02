###############################################################################
# Variables - User configurable inputs
# Defaults aapke setup ke hisaab se: us-central1, CPU-only
###############################################################################

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "notebook_name" {
  description = "Notebook instance ka unique naam (lowercase, hyphens only)"
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,61}[a-z0-9]$", var.notebook_name))
    error_message = "Name lowercase letters, numbers, aur hyphens hi use kare."
  }
}

variable "owner_email" {
  description = "Notebook owner ka email"
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.owner_email))
    error_message = "Valid email address daalein."
  }
}

variable "machine_type" {
  description = "VM machine type (CPU-only by default)"
  type        = string
  default     = "n1-standard-4"
}

variable "team_name" {
  description = "Team ka naam"
  type        = string
  default     = "data-science"
}

variable "environment" {
  description = "Environment (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "enable_gpu" {
  description = "GPU enable karna hai? (default: false for cost savings)"
  type        = bool
  default     = false
}

variable "gpu_type" {
  description = "GPU type"
  type        = string
  default     = "NVIDIA_TESLA_T4"
}

variable "gpu_count" {
  description = "Number of GPUs"
  type        = number
  default     = 1
}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 100
}

variable "idle_timeout_seconds" {
  description = "Auto-stop after idle (cost savings)"
  type        = number
  default     = 10800  # 3 hours
}

variable "disable_public_ip" {
  description = "Public IP disable karna hai?"
  type        = bool
  default     = false
}

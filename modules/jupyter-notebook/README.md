# Jupyter Notebook Module

## Description
Managed Jupyter notebook (Vertex AI Workbench) for data science teams.

## Version
v1.0.0

## Usage

```hcl
module "jupyter_notebook" {
  source = "git::https://github.com/YOUR_USERNAME/terraform-ai-modules-repo.git//modules/jupyter-notebook?ref=v1.0.0"

  project_id    = "my-project-123"
  notebook_name = "my-team-notebook"
  owner_email   = "[email protected]"

  # Optional overrides
  machine_type  = "n1-standard-4"
  team_name     = "data-science"
  environment   = "dev"
}
```

## Inputs

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| project_id | Yes | - | GCP Project ID |
| notebook_name | Yes | - | Unique name (lowercase, hyphens) |
| owner_email | Yes | - | Owner email |
| region | No | us-central1 | GCP region |
| machine_type | No | n1-standard-4 | VM type |
| enable_gpu | No | false | GPU support |
| disk_size_gb | No | 100 | Boot disk size |
| idle_timeout_seconds | No | 10800 | Auto-stop timeout |

## Outputs

| Output | Description |
|--------|-------------|
| notebook_url | Browser URL for Jupyter |
| instance_name | Created instance name |
| console_link | GCP Console link |
| deployment_summary | Full deployment details |

## Required IAM
Service account needs:
- `roles/notebooks.admin`
- `roles/compute.admin`
- `roles/serviceusage.serviceUsageAdmin`

## Estimated Cost
- CPU-only (n1-standard-4): ~$0.19/hour, ~$140/month if 24x7
- With idle timeout: ~$30-45/month for 8hrs/day usage

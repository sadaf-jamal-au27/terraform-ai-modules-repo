# 🤖 AI/ML Service Catalog

Welcome! Ye aapka internal AI services catalog hai. Yahan se aap pre-approved, production-ready AI services apne project mein deploy kar sakti hain.

## Available Services

### 🟢 Active Services

| # | Service | Description | Version | Status |
|---|---------|-------------|---------|--------|
| 1 | [Jupyter Notebook](../modules/jupyter-notebook/README.md) | Managed Jupyter notebook (Vertex AI Workbench) | v1.0.0 | ✅ Live |

### 🟡 Coming Soon

| # | Service | Description | ETA |
|---|---------|-------------|-----|
| 2 | Vertex AI Endpoint | Deploy ML models as REST APIs | TBD |
| 3 | Vertex AI Pipeline | ML workflow automation | TBD |
| 4 | BigQuery ML Dataset | SQL-based ML training | TBD |
| 5 | Cloud Storage ML Bucket | Datasets aur model artifacts | TBD |
| 6 | Dataproc Spark Cluster | Large-scale data processing | TBD |
| 7 | Document AI Processor | OCR aur document parsing | TBD |
| 8 | Vector Search Index | Semantic search engine | TBD |
| 9 | Gemini API Gateway | LLM access with rate limiting | TBD |
| 10 | AutoML Training | No-code ML training | TBD |

---

## How to Use a Service

### Step 1: Browse this catalog
Decide karein konsi service chahiye.

### Step 2: Module ko apne project mein use karein

```hcl
module "my_service" {
  source = "git::https://github.com/YOUR_USERNAME/terraform-ai-modules-repo.git//modules/SERVICE_NAME?ref=v1.0.0"

  # Required inputs (har service ke README mein milenge)
  project_id    = "your-project-id"
  ...
}
```

### Step 3: Deploy
```bash
terraform init
terraform plan
terraform apply
```

---

## Versioning Policy

- **Semantic versioning**: `vMAJOR.MINOR.PATCH`
- Production projects mein **always** specific version use karein (`?ref=v1.0.0`)
- `?ref=main` use **mat** karein production mein
- Breaking changes = MAJOR version bump

## Support

- **Catalog Owner**: AI Platform Team
- **Issues**: GitHub Issues mein file karein
- **Contributions**: PR welcome — `CONTRIBUTING.md` dekhein

## How to Add a New Service

1. `modules/<service-name>/` folder banayein
2. Required files: `main.tf`, `variables.tf`, `outputs.tf`, `README.md`
3. Test karein examples folder mein
4. PR raise karein
5. Approval ke baad new git tag (`v1.x.0`) banayein
6. Catalog (this file) update karein

#!/bin/bash
###############################################################################
# Setup Script - One-shot setup for the AI Service Catalog
# Run from repo root: bash scripts/01-setup-gcp.sh
###############################################################################

set -e  # Error pe rukna

echo "=========================================="
echo "GCP Setup for AI Service Catalog"
echo "=========================================="

# Project ID input
read -p "Aapka GCP Project ID: " PROJECT_ID
if [ -z "$PROJECT_ID" ]; then
    echo "❌ Project ID nahi diya. Exit kar raha hoon."
    exit 1
fi

echo ""
echo "🔧 Step 1: gcloud authenticate kar raha hoon..."
gcloud auth login || true
gcloud auth application-default login || true

echo ""
echo "🔧 Step 2: Default project set kar raha hoon: $PROJECT_ID"
gcloud config set project "$PROJECT_ID"

echo ""
echo "🔧 Step 3: Required APIs enable kar raha hoon..."
gcloud services enable \
    notebooks.googleapis.com \
    compute.googleapis.com \
    aiplatform.googleapis.com \
    cloudresourcemanager.googleapis.com \
    serviceusage.googleapis.com \
    --project="$PROJECT_ID"

echo ""
echo "🔧 Step 4: Current user ko required roles assign kar raha hoon..."
USER_EMAIL=$(gcloud config get-value account)
echo "   User: $USER_EMAIL"

for role in "roles/notebooks.admin" "roles/compute.admin" "roles/iam.serviceAccountUser"; do
    echo "   Assigning: $role"
    gcloud projects add-iam-policy-binding "$PROJECT_ID" \
        --member="user:$USER_EMAIL" \
        --role="$role" \
        --condition=None 2>&1 | tail -1 || true
done

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. cd examples/deploy-jupyter"
echo "2. cp terraform.tfvars.example terraform.tfvars"
echo "3. terraform.tfvars edit karein (project_id aur email daalein)"
echo "4. terraform init"
echo "5. terraform apply"

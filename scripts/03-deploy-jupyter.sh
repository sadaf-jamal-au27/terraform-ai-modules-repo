#!/bin/bash
###############################################################################
# Deploy Script - Jupyter Notebook deploy karne ke liye
###############################################################################

set -e

echo "=========================================="
echo "Deploy Jupyter Notebook"
echo "=========================================="

cd "$(dirname "$0")/../examples/deploy-jupyter"

# Check tfvars exists
if [ ! -f "terraform.tfvars" ]; then
    echo "⚠️  terraform.tfvars file nahi mili."
    echo "Pehle ye karein:"
    echo "  cp terraform.tfvars.example terraform.tfvars"
    echo "  # Phir file edit karein"
    exit 1
fi

echo ""
echo "🔧 Terraform init..."
terraform init

echo ""
echo "🔧 Terraform plan..."
terraform plan

echo ""
read -p "Apply karein? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "🔧 Terraform apply..."
terraform apply -auto-approve

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Outputs:"
terraform output

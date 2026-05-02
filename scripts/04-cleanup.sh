#!/bin/bash
###############################################################################
# Cleanup Script - Resources destroy karne ke liye (cost saving)
###############################################################################

set -e

echo "=========================================="
echo "Destroy Resources"
echo "=========================================="

cd "$(dirname "$0")/../examples/deploy-jupyter"

echo ""
echo "⚠️  Ye command saare deployed resources delete kar dega."
read -p "Confirm karein (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "Cancelled."
    exit 0
fi

terraform destroy -auto-approve

echo ""
echo "✅ Cleanup complete!"

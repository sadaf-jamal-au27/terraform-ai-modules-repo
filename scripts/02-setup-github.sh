#!/bin/bash
###############################################################################
# GitHub Repo Setup Script
# Run after creating empty repo on GitHub
###############################################################################

set -e

echo "=========================================="
echo "GitHub Repo Setup"
echo "=========================================="

read -p "Aapka GitHub username/org: " GH_USER
read -p "Repo ka naam (default: terraform-ai-modules-repo): " REPO_NAME
REPO_NAME=${REPO_NAME:-terraform-ai-modules-repo}

REPO_URL="https://github.com/$GH_USER/$REPO_NAME.git"

echo ""
echo "Repo URL hoga: $REPO_URL"
read -p "Continue? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "🔧 Git initialize kar raha hoon..."
git init -b main 2>/dev/null || git init

echo ""
echo "🔧 Files add kar raha hoon..."
git add .

echo ""
echo "🔧 First commit..."
git commit -m "Initial: Jupyter Notebook service v1.0.0" || echo "Already committed"

echo ""
echo "🔧 Remote add kar raha hoon..."
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

echo ""
echo "🔧 Push to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "🔧 Version tag v1.0.0 banaa raha hoon..."
git tag -a v1.0.0 -m "Release v1.0.0 - Jupyter Notebook"
git push origin v1.0.0

echo ""
echo "✅ GitHub setup complete!"
echo ""
echo "Aapka catalog ab yahan available hai:"
echo "https://github.com/$GH_USER/$REPO_NAME"
echo ""
echo "Module reference URL:"
echo "git::https://github.com/$GH_USER/$REPO_NAME.git//modules/jupyter-notebook?ref=v1.0.0"
echo ""
echo "IMPORTANT: examples/deploy-jupyter/main.tf mein 'YOUR_GITHUB_USERNAME' ko"
echo "$GH_USER se replace karein."

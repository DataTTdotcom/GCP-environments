#!/bin/bash

# Check if terraform destroy is present in the Cloud Build YAML or Terraform configuration
if grep -q "terraform destroy" cloudbuild.yaml; then
  echo "ERROR: terraform destroy found in the build trigger. Aborting the build."
  exit 1  # Non-zero exit code will fail the build
fi

# Optionally, you can also scan other files (e.g., Terraform files) for "destroy"
if grep -r "erraform destroy" ./Projects/*/*/*.tf; then
  echo "ERROR: terraform destroy found in Terraform configurations. Aborting the build."
  exit 1  # Non-zero exit code will fail the build
fi

if grep -r "erraform destroy" ./*.tf; then
  echo "ERROR: terraform destroy found in Terraform configurations. Aborting the build."
  exit 1  # Non-zero exit code will fail the build
fi

echo "No destroy operation detected, proceeding with build."
exit 0
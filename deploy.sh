#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Print each command to the console before executing it.
set -x

# 1. Build the Docker image using Google Cloud Build and push it to Artifact Registry.
gcloud builds submit --tag asia-south1-docker.pkg.dev/shramick-web/service-airo-repo/service-airo:latest .

# 2. Deploy the new image to Cloud Run, setting the production environment variable.
gcloud run deploy service-airo \
  --image=asia-south1-docker.pkg.dev/shramick-web/service-airo-repo/service-airo:latest \
  --platform=managed \
  --region=asia-south1 \
  --set-env-vars=SPRING_PROFILES_ACTIVE=prod

echo "Deployment to production complete."


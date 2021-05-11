---
to: "web/cloudbuild.yaml"
unless_exists: true
---
steps:
    - name: node:12.11.0
      entrypoint: npm
      args: ["install"]
      dir: "web"
    - name: node:12.11.0
      entrypoint: npm
      args: ["run", "prod"]
      dir: "web"
          - "GOOGLE_CLOUD_PROJECT=$PROJECT_ID"
    - name: "gcr.io/cloud-builders/gcloud"
      args: ["app", "deploy", "--no-promote", "--version=$BRANCH_NAME"]
      dir: "web"
timeout: "1600s"

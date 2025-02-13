# GCP Environments

Access control over the GCP environments within Time.

## High-Level Design

- Each GCP project has a separate folder named after the project.
- The project folder contains the following subfolders:
    - **BigQuery**
    - **GCS**
    - **IAM**
    - **Datastream** (only applicable for `time-data-bronze`)
- The respective services in GCP will be constructed using the Terraform files under these subfolders.

## Usage

### CI/CD

- This repository is automated with CI/CD implementation, connected with Google Cloud Build for deployment.
- The `cloudbuild.yaml` file is responsible for the CI/CD process.
- The build will not execute if there is a `terraform destroy` command in the current build.

### Branching Strategy

The repository contains the following branches:
- **main**
- **develop**
- **initial_branch**

The **main** and **develop** branches will always be in sync. The **initial branch** is used for making any changes to the terraform scripts. Once the changes are done, a PR from **initial branch** to **develop** is created. 

1. **Develop to Cloud Build**: 
   - Once changes are merged into the **develop** branch, the `gcp-data-governance-dev` Cloud Build will be triggered. This runs `terraform plan` to give an overall idea of the resources being built in the current deployment.
   
2. **Verify & Merge to Main**:
   - After the **gcp-data-governance-dev** Cloud Build is verified, a PR is created from **develop** to **main**. 
   - Upon merging this PR, the `gcp-data-governance-prod` Cloud Build will be triggered, running `terraform apply` to deploy the changes to the GCP projects.

### Cloud Build URLs

- **gcp-data-governance-dev**:
    ```
    https://console.cloud.google.com/cloud-build/triggers;region=asia-southeast1/edit/b42eb0ec-7194-497b-810b-372265536533?project=time-poc-424210
    ```

- **gcp-data-governance-prod**:
    ```
    https://console.cloud.google.com/cloud-build/triggers;region=asia-southeast1/edit/6e933615-3e91-43c5-9185-6365db85f08f?project=time-poc-424210
    ```

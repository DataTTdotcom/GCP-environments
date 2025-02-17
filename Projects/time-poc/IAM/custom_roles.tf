provider "google" {
  project = "time-poc-424210"
  region  = "asia-southeast1" # Change as needed
}

resource "google_project_iam_custom_role" "custom_role" {
  role_id     = "DataEngineeringRole"  # Change to your desired role ID
  title       = "Data Engineers Role"
  description = "Custom IAM Role for Data Engineers within the Data Team"
  permissions = [
    "bigquery.jobs.create",
    "bigquery.jobs.list",
    "bigquery.jobs.get",
    "bigquery.datasets.get",
    "bigquery.datasets.list"
    "bigquery.tables.get",
    "bigquery.tables.list",
    "bigquery.tables.getData"
  ]
  stage = "GA"  # Options: ALPHA, BETA, GA
}
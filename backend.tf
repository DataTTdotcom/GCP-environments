terraform {
  backend "gcs" {
    bucket = "time-terraform-bucket"
    prefix = "terraform/state/time-poc"
  }
}
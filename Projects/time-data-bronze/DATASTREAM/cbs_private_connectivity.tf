provider "google" {
  project = "time-data-bronze"
  region  = "asia-southeast1"
}

resource "google_datastream_private_connection" "private_connectivity" {
  private_connectivity_config {
    ip_ranges = ["10.70.1.0/29"]
  }
  name     = "time-proxy-prod-cbs"
  location = "asia-southeast1"
  display_name = "Datastream Private Connectivity - CBS prod"
  network = "projects/time-sharedvpc-prdglobal/networks/time-sharedvpc-prd"
}
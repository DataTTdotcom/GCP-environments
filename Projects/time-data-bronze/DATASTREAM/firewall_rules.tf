provider "google" {
  project = "time-sharedvpc-prd"
  region  = "asia-southeast1"
}

resource "google_compute_firewall" "allow_ingress_cbs_prod" {
  name    = "allow-time-proxy-cbs-prod"
  network = "projects/time-sharedvpc-prd/global/networks/time-sharedvpc-prd"

  allow {
    protocol = "tcp"
    ports    = ["1536"]
  }

  source_ranges = ["10.70.1.0/29"]
  target_tags   = ["time-proxy-cbs-prod"]
}
provider "google" {
  project = "time-data-bronze"
  region  = "asia-southeast1"
}

resource "google_compute_instance" "default" {
  name         = "tps-cbs01p"
  machine_type = "e2-standard-2"
  zone         = "asia-southeast1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    subnetwork = "projects/time-sharedvpc-prd/regions/asia-southeast1/subnetworks/time-bronze-datastream-prd-sn"
  }

  tags = ["time-proxy-cbs-prod"]

  metadata_startup_script = <<EOT
#####START
#! /bin/bash
export DB_ADDR=<DATABASE_IP>
export DB_PORT=<DATABASE_PORT>
# Enable the VM to receive packets whose destinations do
# not match any running process local to the VM
echo 1 > /proc/sys/net/ipv4/ip_forward
# Ask the Metadata server for the IP address of the VM nic0
# network interface:
md_url_prefix="http://169.254.169.254/computeMetadata/v1/instance"
vm_nic_ip="$(curl -H "Metadata-Flavor: Google" ${md_url_prefix}/network-interfaces/0/ip)"
# Clear any existing iptables NAT table entries (all chains):
iptables -t nat -F
# Create a NAT table entry in the prerouting chain, matching
# any packets with destination database port, changing the destination
# IP address of the packet to the SQL instance IP address:
iptables -t nat -A PREROUTING \
     -p tcp --dport $DB_PORT \
     -j DNAT \
     --to-destination $DB_ADDR
# Create a NAT table entry in the postrouting chain, matching
# any packets with destination database port, changing the source IP
# address of the packet to the NAT VM's primary internal IPv4 address:
iptables -t nat -A POSTROUTING \
     -p tcp --dport $DB_PORT \
     -j SNAT \
     --to-source $vm_nic_ip
# Save iptables configuration:
iptables-save
#####END
EOT

  service_account {
    email  = "796751615232-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  labels = {
    environment = "production"
  }
}
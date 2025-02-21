provider "google" {
  project = "time-data-bronze"
  region  = "asia-southeast1"
}

resource "google_datastream_connection_profile" "oracle_connection" {
  name     = "oracle-datastream-profile"
  location = "asia-southeast1"
  display_name = "Oracle Datastream Profile"

  oracle {
    hostname = <proxy_server_ip>
    port     = 1521
    username = <db_username>
    password {
      secret_manager_secret_version = "projects/time-data-bronze/secrets/prd-cbs-db-ro-oracle/versions/latest"
    }
    connection_encryption {
      mode = "DISABLED"
    }
  }

  private_connectivity {
    private_connection = google_datastream_private_connection.private_connectivity.name
  }
}
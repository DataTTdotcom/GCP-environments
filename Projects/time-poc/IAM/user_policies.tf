module "projects-time-poc" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.5"

  projects = ["time-poc-424210"]

  bindings = {

    "roles/bigquery.dataViewer" = [
      "user:praveen.ram.kannan@time.com.my"
    ]

    "roles/DataEngineeringRole" = [
        "user:lim.koksang@time.com.my"
        ]

  }
}
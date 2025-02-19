module "projects-time-poc" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.5"

  projects = ["time-poc-424210"]

  bindings = {

    "roles/bigquery.dataViewer" = [
      "user:praveen.ram.kannan@time.com.my"
    ]

    "projects/time-poc-424210/roles/DataEngineeringRole" = [
        "user:lim.koksang@time.com.my"
        ]

  }
}

resource "google_organization_iam_binding" "assign_deny_admin" {
  org_id = "715611036669"

  role    = "roles/iam.denyAdmin"
  members = [
    "user:praveen.ram.kannan@time.com.my",
  ]
}
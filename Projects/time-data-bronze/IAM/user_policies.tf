module "projects-time-data-bronze" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.5"

  projects = ["time-data-bronze"]

  bindings = {

    "roles/bigquery.dataViewer" = [
      "user:praveen.ram.kannan@time.com.my"
    ]

  }
}
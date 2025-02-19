module "time-poc" {
  source = "./Projects/time-poc/IAM"
}

module "time-data-bronze" {
    source = "./Projects/time-data-bronze/IAM"
    }
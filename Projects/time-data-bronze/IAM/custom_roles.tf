provider "google" {
  project = "time-data-bronze"
  region  = "asia-southeast1" # Change as needed
}

resource "google_project_iam_custom_role" "custom_role" {
  role_id     = "DataEngineeringRole"  # Change to your desired role ID
  title       = "Data Engineers Role"
  description = "Custom IAM Role for Data Engineers within the Data Team"
  permissions = [

#   bigquery dataviewer

    "bigquery.datasets.get",
    "bigquery.datasets.getIamPolicy",
    "bigquery.models.export",
    "bigquery.models.getData",
    "bigquery.models.getMetadata",
    "bigquery.models.list",
    "bigquery.routines.get",
    "bigquery.routines.list",
    "bigquery.tables.createSnapshot",
    "bigquery.tables.export",
    "bigquery.tables.get",
    "bigquery.tables.getData",
    "bigquery.tables.getIamPolicy",
    "bigquery.tables.list",
    "bigquery.tables.replicateData",

#   bigquery user

    "bigquery.bireservations.get",
    "bigquery.capacityCommitments.get",
    "bigquery.capacityCommitments.list",
    "bigquery.config.get",
    "bigquery.datasets.create",
    "bigquery.datasets.get",
    "bigquery.datasets.getIamPolicy",
    "bigquery.jobs.create",
    "bigquery.jobs.list",
    "bigquery.models.list",
    "bigquery.readsessions.create",
    "bigquery.readsessions.getData",
    "bigquery.readsessions.update",
    "bigquery.reservationAssignments.list",
    "bigquery.reservationAssignments.search",
    "bigquery.reservations.get",
    "bigquery.reservations.list",
    "bigquery.reservations.listFailoverDatasets",
    "bigquery.routines.list",
    "bigquery.savedqueries.get",
    "bigquery.savedqueries.list",
    "bigquery.tables.list",
    "bigquery.transfers.get",
    "bigquerymigration.translation.translate",
    "dataform.locations.get",
    "dataform.locations.list",
    "dataform.repositories.create",
    "dataform.repositories.list",
    "dataplex.projects.search",

#   GCS viewer

    "resourcemanager.projects.get",
    "resourcemanager.projects.list",
    "storage.folders.get",
    "storage.folders.list",
    "storage.managedFolders.get",
    "storage.managedFolders.list",
    "storage.objects.get",
    "storage.objects.list",

#   Secret manager viewer

    "resourcemanager.projects.get",
    "resourcemanager.projects.list",
    "secretmanager.locations.get",
    "secretmanager.locations.list",
    "secretmanager.secrets.get",
    "secretmanager.secrets.getIamPolicy",
    "secretmanager.secrets.list",
    "secretmanager.secrets.listEffectiveTags",
    "secretmanager.secrets.listTagBindings",
    "secretmanager.versions.get",
    "secretmanager.versions.list",

#   composer user

    "composer.dags.execute",
    "composer.dags.get",
    "composer.dags.getSourceCode",
    "composer.dags.list",
    "composer.environments.get",
    "composer.environments.list",
    "composer.imageversions.list",
    "composer.operations.get",
    "composer.operations.list",
    "composer.userworkloadsconfigmaps.get",
    "composer.userworkloadsconfigmaps.list",
    "composer.userworkloadssecrets.get",
    "composer.userworkloadssecrets.list",
    "serviceusage.quotas.get",
    "serviceusage.services.get",
    "serviceusage.services.list"
  ]
  stage = "GA"  # Options: ALPHA, BETA, GA
}



resource "google_service_account" "service_account_build" {
  count        = var.deploy_infra ? 1 : 0
  project      = var.build_project_id
  account_id   = "sa-iac-terraform-build"
  display_name = "Terraform Service Account"
}

resource "google_service_account" "service_account_nonprod" {
  count        = var.deploy_infra ? 1 : 0
  project      = var.build_project_id
  account_id   = "sa-iac-terraform-nonprod"
  display_name = "Terraform Service Account"
}

resource "google_project_iam_binding" "project_iam_binding_build_editor" {
  count   = var.deploy_infra ? 1 : 0
  project = var.build_project_id
  role    = "roles/editor"
  members = [
    "serviceAccount:${google_service_account.service_account_build[0].email}",
  ]
}


resource "google_service_account" "service_account_prod" {
  count        = var.deploy_infra ? 1 : 0
  project      = var.build_project_id
  account_id   = "sa-iac-terraform-prod"
  display_name = "Terraform Service Account"
}

resource "google_project_iam_binding" "project_iam_binding_build_logwriter" {
  count   = var.deploy_infra ? 1 : 0
  project = var.build_project_id
  role    = "roles/logging.logWriter"
  members = [
    "serviceAccount:${google_service_account.service_account_nonprod[0].email}",
    "serviceAccount:${google_service_account.service_account_prod[0].email}",
    "serviceAccount:sa-iac-terraform-nonprod@${var.build_project_id}.iam.gserviceaccount.com"
  ]
}

resource "google_project_iam_binding" "project_iam_binding_build_storageadmin" {
  count   = var.deploy_infra ? 1 : 0
  project = var.build_project_id
  role    = "roles/storage.objectAdmin"
  members = [
    "serviceAccount:${google_service_account.service_account_build[0].email}",
    "serviceAccount:${google_service_account.service_account_nonprod[0].email}",
    "serviceAccount:${google_service_account.service_account_prod[0].email}",
    "serviceAccount:sa-iac-terraform-nonprod@${var.build_project_id}.iam.gserviceaccount.com"
  ]
}


resource "google_project_iam_binding" "project_iam_binding_env_editor" {
  count   = var.deploy_infra ? 1 : 0
  project = var.environments_project_id
  role    = "roles/editor"

  members = [
    "serviceAccount:${google_service_account.service_account_nonprod[0].email}",
    "serviceAccount:${google_service_account.service_account_prod[0].email}",
    "user:alexander.salamanca@endava.com"
    "user:juansebastian.castanedaflorez@endava.com""
  ]
}



resource "google_service_account" "service_account_build" {
  project = var.build_project_id
  account_id   = "sa-iac-terraform-build"
  display_name = "Terraform Service Account"
}

resource "google_project_iam_binding" "project_iam_binding_build_editor" {
  project = var.build_project_id
  role    = "roles/editor"
  members = [
    "serviceAccount:${google_service_account.service_account_build.email}",
  ]
}

resource "google_service_account" "service_account_dev" {
  project = var.build_project_id
  account_id   = "sa-iac-terraform-dev"
  display_name = "Terraform Service Account"
}


resource "google_service_account" "service_account_prod" {
  project = var.build_project_id
  account_id   = "sa-iac-terraform-prod"
  display_name = "Terraform Service Account"
}

resource "google_project_iam_binding" "project_iam_binding_env_editor" {
  project = var.environments_project_id
  role    = "roles/editor"

  members = [
    "serviceAccount:${google_service_account.service_account_dev.email}",
    "serviceAccount:${google_service_account.service_account_prod.email}",
  ]
}

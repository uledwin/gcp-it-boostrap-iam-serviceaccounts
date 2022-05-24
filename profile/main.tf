resource "google_service_account" "service_account" {
  account_id   = "sa-iac-terraform"
  display_name = "Terraform Service Account"
}
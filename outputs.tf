output "service_account_nonprod_id" {
  value = google_service_account.service_account_nonprod[0].id
}

output "service_account_prod_id" {
  value = google_service_account.service_account_prod[0].id
}

output "service_account_build_id" {
  value = google_service_account.service_account_build[0].id
}
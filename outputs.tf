output service_account_nonprod_id {
    value = google_service_account.service_account_nonprod.email
}

output service_account_prod_id {
    value = google_service_account.service_account_prod.email
}

output service_account_nonprod_id {
    value = google_service_account.service_account_build.email
}
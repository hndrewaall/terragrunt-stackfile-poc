unit "bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "${values.location}/gcs-buckets/main"

  values = {
    name_suffix = "main"
    environment = values.environment
    location    = values.location
  }
}

unit "service_account" {
  source = "${get_repo_root()}/units/iam-svc-account"
  path   = "${values.location}/iam-svc-accounts/main"

  values = {
    account_id   = "andrew-testing-buckets"
    display_name = "Andrew Testing (buckets)"
  }
}

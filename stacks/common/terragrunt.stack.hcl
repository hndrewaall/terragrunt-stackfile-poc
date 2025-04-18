locals {
  values = values
}

unit "bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "gcs-buckets/main"

  values = {
    name_suffix = "main"
    environment = values.environment
    location    = values.location
  }
}

unit "service_account" {
  source = "${get_repo_root()}/units/iam-svc-account"
  path   = "iam-svc-accounts/main"

  values = {
    account_id   = "andrew-testing-buckets"
    display_name = "Andrew Testing (buckets)"
  }
}

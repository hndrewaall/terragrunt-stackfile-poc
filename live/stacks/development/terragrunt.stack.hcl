locals {
  environment = "development"
  location    = "us"
  region      = "us-central1"
  project_id  = get_env("TG_DEVELOPMENT_GCP_PROJECT")
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"

  values = local
}

unit "extra_service_account" {
  source = "${get_repo_root()}/units/iam-svc-account"
  path   = "iam-svc-accounts/extra"

  values = {
    account_id   = "andrew-testing-extra"
    display_name = "Andrew Testing (extra)"
  }
}

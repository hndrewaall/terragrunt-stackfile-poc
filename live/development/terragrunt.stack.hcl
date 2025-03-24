locals {
  environment = "development"
  location    = "us"
  region      = "us-central1"
  project_id  = get_env("TG_DEVELOPMENT_GCP_PROJECT")
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"
}

unit "extra-bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "us/gcs-buckets/extra"

  values = {
    name_suffix = "extra"
  }
}

locals {
  environment = "production"
  location    = "us"
  region      = "us-central1"
  project_id  = get_env("TG_PRODUCTION_GCP_PROJECT")
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"

  values = local
}

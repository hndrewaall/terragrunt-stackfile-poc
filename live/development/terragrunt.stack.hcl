locals {
  environment = "development"
  location    = "us"
  region      = "us-central1"
  project_id  = get_env("TG_DEVELOPMENT_GCP_PROJECT")
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"

  values = {
    environment = local.environment
    location    = local.location
  }
}

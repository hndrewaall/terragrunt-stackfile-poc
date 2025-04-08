locals {
  environment = "production-eu"
  location    = "europe"
  region      = "europe-west3"
  project_id  = get_env("TG_PRODUCTION_EU_GCP_PROJECT")
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"

  values = local
}

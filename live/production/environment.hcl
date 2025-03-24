locals {
  environment = "production"
  project_id  = get_env("TG_PRODUCTION_GCP_PROJECT")
}

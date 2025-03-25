locals {
  environment = "staging"
  location    = "us"
  region      = "us-central1"
  project_id  = get_env("TG_STAGING_GCP_PROJECT")
}

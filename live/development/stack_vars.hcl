locals {
  environment = "development"
  location    = "us"
  region      = "us-central1"
  project_id  = get_env("TG_DEVELOPMENT_GCP_PROJECT")
}

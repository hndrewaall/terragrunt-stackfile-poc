locals {
  environment = "production-eu"
  location    = "europe"
  region      = "europe-west3"
  project_id  = get_env("TG_PRODUCTION_GCP_PROJECT")
}

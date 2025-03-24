locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  location_vars    = read_terragrunt_config(find_in_parent_folders("location.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  project_id = local.environment_vars.locals.project_id
  region     = local.region_vars.locals.region
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project               = "${local.project_id}"
  region                = "${local.region}"
  user_project_override = true
  billing_project       = "${local.project_id}"
}

provider "google-beta" {
  project               = "${local.project_id}"
  region                = "${local.region}"
  user_project_override = true
  billing_project       = "${local.project_id}"
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "gcs" {
    bucket = "${get_env("TG_STATE_BUCKET")}"
    prefix = "stackfile-poc/${path_relative_to_include()}"
  }
}
EOF
}

inputs = merge(
  local.environment_vars.locals,
  local.location_vars.locals,
  local.region_vars.locals,
)

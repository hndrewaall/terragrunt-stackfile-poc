locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  project_vars     = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  location_vars    = read_terragrunt_config(find_in_parent_folders("location.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  shared_vars = {
    environment = local.environment_vars.locals.environment
    project_id  = local.project_vars.locals.project_id
    location    = local.location_vars.locals.location
    region      = local.region_vars.locals.region
  }

  project_id = local.shared_vars.project_id
  region     = local.shared_vars.region
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
    prefix = "stackfile-poc/vanilla/${path_relative_to_include()}"
  }
}
EOF
}

inputs = local.shared_vars

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  project = local.environment_vars.locals.project
  region  = local.region_vars.locals.region
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project               = "${local.project}"
  region                = "${local.region}"
  user_project_override = true
  billing_project       = "${local.project}"
}

provider "google-beta" {
  project               = "${local.project}"
  region                = "${local.region}"
  user_project_override = true
  billing_project       = "${local.project}"
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "gcs" {
    bucket   = ${get_env("TG_STATE_BUCKET")}
    key      = "stackfile-poc/${path_relative_to_include()}"
    project  = ${get_env("TG_STATE_PROJECT")}
    location = "us"
  }
}
EOF
}

inputs = merge(
  local.environment_vars.locals,
  local.region_vars.locals,
)

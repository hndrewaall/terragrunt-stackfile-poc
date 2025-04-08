locals {
  # Pull out shared vars from stackfiles, accounting for both nested and non nested cases
  stack_vars  = read_terragrunt_config(find_in_parent_folders("terragrunt.stack.hcl"))
  shared_vars = try(local.stack_vars.local.values, local.stack_vars.local)

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
    prefix = "stackfile-poc/stacks/${path_relative_to_include()}"
  }
}
EOF
}

inputs = local.shared_vars

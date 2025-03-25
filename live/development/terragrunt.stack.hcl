locals {
  stack_vars = read_terragrunt_config("stack_vars.hcl")
  location   = local.stack_vars.locals.location
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"

  values = {
    location = local.location
  }
}

unit "extra-bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "${local.location}/gcs-buckets/extra"

  values = {
    location    = local.location
    name_suffix = "extra"
  }
}

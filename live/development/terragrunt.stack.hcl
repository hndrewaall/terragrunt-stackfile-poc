locals {
  stack_vars  = read_terragrunt_config("stack_vars.hcl")
  environment = local.stack_vars.locals.environment
  location    = local.stack_vars.locals.location
}

stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"

  values = {
    environment = local.environment
    location    = local.location
  }
}

unit "extra-bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "${local.location}/gcs-buckets/extra"

  values = {
    name_suffix = "extra"
    environment = local.environment
    location    = local.location
  }
}

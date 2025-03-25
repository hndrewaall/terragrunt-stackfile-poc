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

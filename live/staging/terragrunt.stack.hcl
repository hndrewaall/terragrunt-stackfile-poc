stack "common" {
  source                  = "${get_repo_root()}/stacks/common"
  path                    = "common"
  no_dot_terragrunt_stack = true
}

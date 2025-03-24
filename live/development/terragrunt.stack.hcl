stack "common" {
  source                  = "${get_repo_root()}/stacks/common"
  path                    = "common"
  no_dot_terragrunt_stack = true
}

unit "extra-bucket" {
  source                  = "${get_repo_root()}/units/gcs-bucket"
  path                    = "us/gcs-buckets/extra"
  no_dot_terragrunt_stack = true

  values = {
    name_suffix = "extra"
  }
}

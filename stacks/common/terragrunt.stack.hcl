unit "bucket" {
  source                  = "${get_repo_root()}/modules/gcs_bucket"
  path                    = "us/gcs-buckets/main"
  no_dot_terragrunt_stack = true

  values = {
    name_suffix = "main"
  }
}

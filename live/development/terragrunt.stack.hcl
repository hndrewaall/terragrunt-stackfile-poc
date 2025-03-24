stack "common" {
  source = "${get_repo_root()}/stacks/common"
  path   = "common"
}

unit "extra-bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "us/gcs-buckets/extra"

  values = {
    name_suffix = "extra"
  }
}

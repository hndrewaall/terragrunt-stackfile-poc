unit "bucket" {
  source = "${get_repo_root()}/modules/gcs_bucket"
  path   = "us/gcs-buckets/main"

  values = {
    name_suffix = "main"
  }
}

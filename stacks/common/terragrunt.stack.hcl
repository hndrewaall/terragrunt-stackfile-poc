unit "bucket" {
  source = "${get_repo_root()}/units/gcs-bucket"
  path   = "${values.location}/gcs-buckets/main"

  values = {
    name_suffix = "main"
    environment = values.environment
    location    = values.location
  }
}

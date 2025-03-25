include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/modules/gcs_bucket"
}

inputs = {
  name_suffix = values.name_suffix
  environment = values.environment
  location    = values.location
}

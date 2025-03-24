include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "environment" {
  path   = find_in_parent_folders("environment.hcl")
  expose = true
}

terraform {
  source = "${path_relative_from_include("root")}/../modules/gcs_bucket"
}

inputs = {
  name_suffix = "testing-${include.environment.locals.environment}"
}

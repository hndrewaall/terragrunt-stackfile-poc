include "root" {
  path = find_in_parent_folders("root.hcl")
}

include {
  path = "${get_repo_root()}/templates/gcs-buckets/main/terragrunt.hcl"
}

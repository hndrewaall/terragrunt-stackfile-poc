include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/modules/iam_svc_account"
}

inputs = {
  account_id   = "andrew-testing-buckets"
  display_name = "Andrew Testing (buckets)"
}

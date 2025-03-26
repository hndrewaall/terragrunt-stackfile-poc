include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/modules/iam_svc_account"
}

inputs = {
  account_id   = values.account_id
  display_name = values.display_name
}

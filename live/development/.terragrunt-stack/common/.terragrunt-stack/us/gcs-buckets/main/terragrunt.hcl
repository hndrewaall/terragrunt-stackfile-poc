include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/modules/gcs_bucket"
}

dependency "iam_svc_account" {
  config_path = "../../iam-svc-accounts/main"

  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    email = "hndrewaall@gmail.com"
  }
}


inputs = {
  name_suffix = values.name_suffix
  environment = values.environment
  location    = values.location
  readers = [
    dependency.iam_svc_account.outputs.email
  ]
}

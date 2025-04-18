terraform {
  source = "${get_repo_root()}/modules/gcs_bucket"
}

dependency "iam_svc_account" {
  config_path = "../../iam-svc-accounts/main"

  # mock_outputs_allowed_terraform_commands = ["plan", "validate"]
  mock_outputs = {
    email = "serviceAccount:hndrewaall@gmail.com"
  }
}

inputs = {
  name_suffix = "main"
  reader      = dependency.iam_svc_account.outputs.email
}

stack "repro-terragrunt-show-fail" {
  terraform_workflow_tool  = "OPEN_TOFU"
  opentofu_version         = "1.10.6"
  terragrunt_version       = "0.83.2"
  project_root             = "."

  environment = {
    AWS_EC2_METADATA_DISABLED = "true"
    TG_DOWNLOAD_DIR           = "/tmp/.terragrunt_cache/downloads"
    TG_LOG_LEVEL              = "info"
    TG_PROVIDER_CACHE         = "1"
    TG_PROVIDER_CACHE_DIR     = "/tmp/.terragrunt_cache/providers"
    TG_TF_PATH                = "tofu"
  }

  terragrunt {
    use_run_all            = true
    use_smart_sanitization = true
    terragrunt_tool        = "OPEN_TOFU"
  }

  before_init = [
    "terragrunt --version",
    "tofu version",
  ]

  # This is what makes Spacelift's built-in 'show' step fail with exit 1
  after_plan = [
    "echo 'Deleting per-module plan in $(pwd)'",
    "rm -f spacelift.plan || true",
  ]
}
#test
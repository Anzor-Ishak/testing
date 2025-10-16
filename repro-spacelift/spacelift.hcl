stack "repro-terragrunt-show-fail" {
  # Make the UI look like the customer's environment
  terraform_version        = "1.10.6"
  opentofu_version         = "1.10.6"
  terragrunt_version       = "0.83.2"
  terraform_workflow_tool  = "OPEN_TOFU"  # use OpenTofu
  project_root             = "."          # repo root; modules are discovered by terragrunt run-all
  
environment = {
  AWS_EC2_METADATA_DISABLED = "true"
  TG_DOWNLOAD_DIR           = "/tmp/.terragrunt_cache/downloads"
  TG_LOG_LEVEL              = "info"
  TG_PROVIDER_CACHE         = "1"
  TG_PROVIDER_CACHE_DIR     = "/tmp/.terragrunt_cache/providers"
  TG_TF_PATH                = "tofu"            # <-- add this
}


  terragrunt {
    use_run_all             = true
    use_smart_sanitization  = true
    terragrunt_tool         = "OPEN_TOFU"
  }

  # Useful to mirror customer's before_init
  before_init = [
    "terragrunt --version",
    "tofu version",
    "mkdir -p ~/.ssh",
    "touch ~/.ssh/id_ed25519 && chmod 400 ~/.ssh/id_ed25519 || true",
    "ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts || true"
  ]

  # *** Core of the repro ***
  # After plan succeeds, delete the per-module plan so Spacelift's 'show' fails.
  # Spacelift runs 'plan' inside each module directory with -out=spacelift.plan.
  # We remove that file here; the subsequent built-in 'show' step will fail with exit code 1,
  # producing the exact "unexpected exit code when running show command: 1" message.
  after_plan = [
    "echo 'Simulating missing plan artifact: deleting spacelift.plan in $(pwd)'",
    "rm -f spacelift.plan || true"
  ]

  # (Optional) If you want to stamp the run-id-looking prefix in the logs,
  # add a cosmetic echo. The actual error line will still be emitted by Spacelift’s show step.
  # after_plan += [ "echo '[01K7N277CRMM7F1A6KAKEFPMCG] repro marker: plan file removed'" ]
}

terraform {
  required_version = ">= 1.6.0"
  backend "local" {}  # <-- required for Terragrunt remote_state to attach
}
resource "null_resource" "ok" {}

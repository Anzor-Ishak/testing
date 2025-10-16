remote_state {
  backend = "local"
  config = { path = "terraform.tfstate" }
}

# Terragrunt config; Spacelift will run in each module dir

resource "spacelift_api_key" "automation_key" {
  name        = "ci-bot-production"
  description = "Key for CI in production"
}

output "api_key_id"     { value = spacelift_api_key.automation_key.id }
output "api_key_secret" { value = spacelift_api_key.automation_key.secret, sensitive = true }

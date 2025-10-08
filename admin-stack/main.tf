# 4.1) Create an API key (org-level object)
resource "spacelift_api_key" "automation" {
  name        = var.key_name
  description = "Created by Terraform for automation demo"
}

# 4.2) (Option A) Reuse the built-in "Space Admin" role in a target Space.
# If your org uses RBAC with predefined roles, this is typically available.
# We'll attach that role to the new key in the Space you pass via var.space_id.

# Data source placeholder (if supported in your env) – otherwise hardcode a role id you already know.
# data "spacelift_role" "space_admin" {
#   name = "Space Admin"
# }

# 4.3) Attach the role to the API key in the target Space
# The role attachment binds: (api_key) -> (role) in (space)
resource "spacelift_role_attachment" "key_has_space_admin" {
  api_key_id = spacelift_api_key.automation.id
  role_id    = "SPACE_ADMIN"   # replace with the actual role ID in your org if needed
  space_id   = var.space_id
}

# 4.4) Useful outputs – capture the new key's ID and one-time Secret
# NOTE: The secret is returned only on creation. Store it safely!
output "api_key_id" {
  value = spacelift_api_key.automation.id
}

output "api_key_secret" {
  value     = spacelift_api_key.automation.secret
  sensitive = true
}

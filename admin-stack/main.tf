resource "spacelift_api_key" "easy" {
  name = "easy-key"
}

output "easy_key_id" {
  value = spacelift_api_key.easy.token_id
}

output "easy_key_secret" {
  value     = spacelift_api_key.easy.token_value
  sensitive = true
}

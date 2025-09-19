resource "terraform_data" "aws_auth_maproles" {
  # Read the large YAML straight into the resource.
  input = file("${path.module}/maproles.yaml")
}
output "maproles_size_bytes" {
  value = length(file("${path.module}/maproles.yaml"))
}

locals {
  maproles_text  = file("${path.module}/maproles.yaml")
  maproles_list  = yamldecode(local.maproles_text)          # YAML list of role entries
  maproles_total = length(local.maproles_list)

  # Per-entry short digest (order-preserving)
  maproles_entry_hashes = [
    for r in local.maproles_list :
    substr(sha256(jsonencode(r)), 0, 8)
  ]

  # Whole-file digest to catch any change at all
  maproles_file_hash = substr(sha256(local.maproles_text), 0, 8)
}

output "maproles_total" {
  value = local.maproles_total
}

output "maproles_file_hash" {
  value = local.maproles_file_hash
}

output "maproles_entry_hashes" {
  value = local.maproles_entry_hashes
}


resource "terraform_data" "aws_auth_maproles" {
  # Read the large YAML straight into the resource.
  input = file("${path.module}/maproles.yaml")
}
output "maproles_size_bytes" {
  value = length(file("${path.module}/maproles.yaml"))
}

locals {
  maproles_text  = file("${path.module}/maproles.yaml")
  maproles_list  = yamldecode(local.maproles_text)          # parse YAML list
  maproles_total = length(local.maproles_list)

  # per-entry short digest (order-preserving)
  maproles_entry_hashes = [
    substr(sha256(jsonencode(r)), 0, 8) for r in local.maproles_list
  ]

  # whole-file digest to catch any change at all
  maproles_file_hash = substr(sha256(local.maproles_text), 0, 8)
}

output "maproles_total"       { value = local.maproles_total }
output "maproles_file_hash"   { value = local.maproles_file_hash }
output "maproles_entry_hashes" {
  value = local.maproles_entry_hashes
}

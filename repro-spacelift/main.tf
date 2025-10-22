variable "flip" {
  type    = string
  default = "A"  # we'll toggle this via Terragrunt to force a change
}

resource "random_id" "example" {
  byte_length = 4
  keepers = {
    flip = var.flip
  }
}

output "id_hex" {
  value = random_id.example.hex
}

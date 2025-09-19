resource "terraform_data" "aws_auth_maproles" {
  # Read the large YAML straight into the resource.
  input = file("${path.module}/maproles.yaml")
}
output "maproles_size_bytes" {
  value = length(file("${path.module}/maproles.yaml"))
}

#test policy

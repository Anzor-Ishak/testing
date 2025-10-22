terraform {
  required_version = ">= 1.6.0"
  backend "local" {}  # <-- required
}
variable "noop" { default = "x" }

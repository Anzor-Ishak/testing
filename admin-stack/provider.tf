provider "spacelift" {}  # job token for everything else

provider "spacelift" {
  alias            = "api"
  api_key_endpoint = "https://anzor-ishak.app.spacelift.io"
  api_key_id       = var.api_key_id
  api_key_secret   = var.api_key_secret
}

terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://anzor-ishak.app.spacelift.io"
  api_key_id       = var.api_key_id
  api_key_secret   = var.api_key_secret
}

resource "spacelift_api_key" "test1" { 
  name        = "Test API Key 1"
} 

variable "api_key_id"     { type = string; sensitive = true }
variable "api_key_secret" { type = string; sensitive = true }

terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

provider "spacelift" {
  # When running outside Spacelift, use an API key:
  # (set these as environment variables before 'init/plan/apply')
  # SPACELIFT_API_KEY_ENDPOINT
  # SPACELIFT_API_KEY_ID
  # SPACELIFT_API_KEY_SECRET
}

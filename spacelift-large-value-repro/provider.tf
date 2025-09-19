provider "kubernetes" {
  host                   = "https://example.invalid"
  token                  = "fake"
  insecure               = true
  config_context_cluster = "false"
}

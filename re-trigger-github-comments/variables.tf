variable "force_fail" {
  type    = bool
  default = true
  validation {
    condition     = var.force_fail == false
    error_message = "Forced failure for demo."
  }
}
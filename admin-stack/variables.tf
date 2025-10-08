variable "space_id" {
  description = "The Space where the role will apply (e.g. child space slug)"
  type        = string
}

variable "key_name" {
  description = "Human-friendly name for the API key to create"
  type        = string
  default     = "tf-created-automation-key"
}
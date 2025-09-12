resource "random_pet" "demo" {
  length = 2

  lifecycle {
    precondition {
      condition     = var.fail_demo == false
      error_message = "Forced failure for demo."
    }
  }
}

output "pet_name" {
  value = random_pet.demo.id
}
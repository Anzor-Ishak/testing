resource "spacelift_role" "infra_dev_min" {
  name        = "TEST_Infrastructure_Developer_Min"
  description = "test bulk actions"
  actions = [
    "space:read",
    "stack:read",
    "run:read",
    "run:trigger",
  ]
}

resource "spacelift_role_attachment" "attach_user" {
  role_id  = spacelift_role.infra_dev_min.id
  user_id  = "AnzorIshak"
  space_id = "root"
}


#commit
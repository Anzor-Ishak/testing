terraform {
  source = "${include.root.locals.module_path}"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = { flip = "A" }  # we'll flip this to "B" to force "1 to change"

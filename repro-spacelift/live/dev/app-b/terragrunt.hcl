terraform {
  source = "${include.root.locals.module_path}"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = { flip = "A" }  # stays the same

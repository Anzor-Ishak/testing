resource "spacelift_role" "infra_dev_min" {
  name        = "TEST_Infrastructure_Developer_Min"
  description = "test bulk actions"
  actions = [
      "CONTEXT_CREATE",
      "CONTEXT_DELETE",
      "CONTEXT_UPDATE",
      "RUN_CANCEL",
      "RUN_CANCEL_BLOCKING",
      "RUN_COMMENT",
      "RUN_CONFIRM",
      "RUN_DISCARD",
      "RUN_PRIORITIZE_SET",
      "RUN_PROMOTE",
      "RUN_PROPOSE_LOCAL_WORKSPACE",
      "RUN_PROPOSE_WITH_OVERRIDES",
      "RUN_RETRY",
      "RUN_RETRY_BLOCKING",
      "RUN_REVIEW",
      "RUN_STOP",
      "RUN_STOP_BLOCKING",
      "RUN_TARGETED_REPLAN",
      "RUN_TRIGGER",
      "RUN_TRIGGER_WITH_CUSTOM_RUNTIME_CONFIG",
      "SPACE_READ",
      "SPACE_WRITE",
      "STACK_ADD_CONFIG",
      "STACK_DELETE",
      "STACK_DELETE_CONFIG",
      "STACK_DISABLE",
      "STACK_ENABLE",
      "STACK_LOCK",
      "STACK_MANAGE",
      "STACK_MANAGED_STATE_IMPORT",
      "STACK_MANAGED_STATE_ROLLBACK",
      "STACK_SET_CURRENT_COMMIT",
      "STACK_SYNC_COMMIT",
      "STACK_UNLOCK",
      "STACK_UNLOCK_FORCE",
      "STACK_UPLOAD_LOCAL_WORKSPACE",
      "TASK_CREATE"
  ]
}

resource "spacelift_role_attachment" "attach_user" {
  role_id  = spacelift_role.infra_dev_min.id
  user_id  = "01JT99BE7EQAM6GANGT9A1T208"
  space_id = "root"
}


#commit
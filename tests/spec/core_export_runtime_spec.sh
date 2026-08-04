# shellcheck shell=bash disable=SC2016
Describe 'core export runtime helpers'
  SCRIPT="$SHELLSPEC_PROJECT_ROOT/scripts/export-runtime.sh"
  RUNNER="$SHELLSPEC_PROJECT_ROOT/tests/helpers/run-bootstrap-lib.sh"

  It 'writes install-config.env with frozen export variables'
    When run /usr/bin/bash "$RUNNER" "$SCRIPT" '
      tmpdir="$(mktemp -d)"
      export_runtime_init
      export_runtime_add_env "PRODUCTIVE_K3S_STACK_NAME" "base"
      export_runtime_add_env "TELEMETRY_ENABLED" "false"
      export_runtime_add_env "PRODUCTIVE_K3S_EXPORT_OUTPUT" "/tmp/bundle dir"
      export_runtime_write_install_config "${tmpdir}/install-config.env"
      cat "${tmpdir}/install-config.env"'
    The status should equal 0
    The output should include "export PRODUCTIVE_K3S_STACK_NAME='base'"
    The output should include "export TELEMETRY_ENABLED='false'"
    The output should include "export PRODUCTIVE_K3S_EXPORT_OUTPUT='/tmp/bundle dir'"
  End

  It 'writes manifest.json with resolved export metadata'
    When run /usr/bin/bash "$RUNNER" "$SCRIPT" '
      tmpdir="$(mktemp -d)"
      export_runtime_init
      export_runtime_set_metadata "command" "stack export"
      export_runtime_set_metadata "subject_kind" "stack"
      export_runtime_set_metadata "subject_ref" "base"
      export_runtime_set_metadata "artifact_name" "stack.tgz"
      export_runtime_set_metadata "interactive" "false"
      export_runtime_set_metadata "telemetry_enabled" "false"
      export_runtime_write_manifest "${tmpdir}/manifest.json"
      cat "${tmpdir}/manifest.json"'
    The status should equal 0
    The output should include '"schema_version": "1"'
    The output should include '"command": "stack export"'
    The output should include '"kind": "stack"'
    The output should include '"ref": "base"'
    The output should include '"artifact_name": "stack.tgz"'
    The output should include '"interactive": "false"'
    The output should include '"telemetry_enabled": "false"'
  End
End

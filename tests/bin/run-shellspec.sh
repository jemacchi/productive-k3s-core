#!/usr/bin/env bash
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/helpers/test-common.sh"

need_cmd shellspec

cd "${REPO_DIR}"
mapfile -t spec_files < <(find tests/spec -maxdepth 1 -type f -name '*_spec.sh' | sort)
mock_bin_dir="$(mktemp -d)"
trap 'rm -rf "${mock_bin_dir}"' EXIT

cat >"${mock_bin_dir}/sudo" <<'EOF'
#!/usr/bin/env bash
printf 'unexpected sudo invocation during shellspec: %s\n' "$*" >&2
exit 99
EOF
chmod +x "${mock_bin_dir}/sudo"

PATH="${mock_bin_dir}:${PATH}" exec shellspec --chdir "${REPO_DIR}" -s bash "${spec_files[@]}"

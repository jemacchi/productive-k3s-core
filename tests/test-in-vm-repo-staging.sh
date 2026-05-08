#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

fail() {
  printf '[FAIL] %s\n' "$1" >&2
  exit 1
}

pass() {
  printf '[PASS] %s\n' "$1"
}

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

FIXTURE_REPO="${TMP_DIR}/fixture-repo"
mkdir -p "${FIXTURE_REPO}/docs/.venv/bin" "${FIXTURE_REPO}/docs/site" "${FIXTURE_REPO}/runs" "${FIXTURE_REPO}/test-artifacts" "${FIXTURE_REPO}/scripts"
printf '#!/usr/bin/env bash\n' > "${FIXTURE_REPO}/scripts/example.sh"
printf 'hello\n' > "${FIXTURE_REPO}/README.md"
ln -s /usr/bin/python3 "${FIXTURE_REPO}/docs/.venv/bin/python3"
ln -s python3 "${FIXTURE_REPO}/docs/.venv/bin/python"
printf 'built docs\n' > "${FIXTURE_REPO}/docs/site/index.html"
printf '{}\n' > "${FIXTURE_REPO}/runs/bootstrap.json"
printf '{}\n' > "${FIXTURE_REPO}/test-artifacts/test.json"

export PRODUCTIVE_K3S_LIB_ONLY=1
# shellcheck source=tests/test-in-vm.sh
source "${REPO_DIR}/tests/test-in-vm.sh"

REPO_DIR="$FIXTURE_REPO"
REPO_NAME="fixture-transfer"
REMOTE_DIR="/home/ubuntu/${REPO_NAME}"

prepare_repo_transfer_dir
staged_repo="$TRANSFER_STAGED_REPO"

[[ -f "${staged_repo}/README.md" ]] || fail "staged repo is missing tracked content"
[[ -f "${staged_repo}/scripts/example.sh" ]] || fail "staged repo is missing scripts content"
[[ ! -e "${staged_repo}/docs/.venv" ]] || fail "staged repo unexpectedly contains docs/.venv"
[[ ! -e "${staged_repo}/docs/site" ]] || fail "staged repo unexpectedly contains docs/site"
[[ ! -e "${staged_repo}/runs" ]] || fail "staged repo unexpectedly contains runs"
[[ ! -e "${staged_repo}/test-artifacts" ]] || fail "staged repo unexpectedly contains test-artifacts"
pass "repo staging excludes local-only directories before VM transfer"

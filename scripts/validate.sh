#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v java >/dev/null 2>&1; then
  echo "Java 21 or later is required to validate the backend." >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required to validate the frontend." >&2
  exit 1
fi

(
  cd "$root_dir"
  ./mvnw --batch-mode --no-transfer-progress verify
)

(
  cd "$root_dir/frontend"
  npm ci
  npm run lint
  npm run build
)

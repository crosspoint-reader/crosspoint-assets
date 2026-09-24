#!/usr/bin/env bash
set -euo pipefail

firmware_dir="${1:?Pass a pinned firmware checkout}"
hypher_dir="${2:?Pass a pinned Hypher checkout}"
release_tag="${3:?Pass an immutable release tag}"

python3 "$firmware_dir/scripts/build-hyphenation-assets.py" \
  --hypher "$hypher_dir" \
  --output dist \
  --base-url "https://github.com/crosspoint-reader/crosspoint-assets/releases/download/$release_tag" \
  --revision d81cc506416bffef2a75ee2dc969d4b41bc36613

(cd dist && sha256sum -c SHA256SUMS)

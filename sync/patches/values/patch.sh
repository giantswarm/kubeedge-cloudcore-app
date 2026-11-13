#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh

set -x
git apply "${SCRIPT_DIR_REL}/_values.yaml.patch"
{ set +x; } 2>/dev/null

# Generate schema
echo "Generating values schema..."
if ! helm plugin list | grep -q values-schema-json; then
  helm plugin install https://github.com/losisin/helm-values-schema-json.git --verify=false || true
fi
helm schema -f "${CHART_DIR}"/values.yaml -o "${CHART_DIR}"/values.schema.json

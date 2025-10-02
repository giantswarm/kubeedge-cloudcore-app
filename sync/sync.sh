#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly dir
cd "${dir}/.."

set -x
# Sync using vendir
vendir sync
{ set +x; } 2>/dev/null

# patches
./sync/patches/chart/patch.sh
./sync/patches/values/patch.sh
./sync/patches/service/patch.sh
./sync/patches/configmap/patch.sh
./sync/patches/helpers/patch.sh
./sync/patches/hook-jobs/patch.sh
./sync/patches/policy-exceptions/patch.sh
./sync/patches/readme/patch.sh
./sync/patches/kube-linter/patch.sh
# crds should always be last
./sync/patches/crds/patch.sh

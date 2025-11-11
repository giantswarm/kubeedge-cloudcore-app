#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir
CHART_DIR="${repo_dir}/helm/kubeedge-cloudcore" ; readonly CHART_DIR

cd "${repo_dir}"

readonly script_dir_rel=".${script_dir#"${repo_dir}"}"

cp "${script_dir}"/manifests/Chart.yaml ./helm/kubeedge-cloudcore/

# we need to set the appVersion field in Chart.yaml to match the
# version being synced from upstream.

# get the upstream sync version from vendir.yml
UPSTREAM_SYNC_VERSION=$(yq -r .directories[0].contents[0].git.ref ./vendir.yml)
# remove leading 'v' if present
UPSTREAM_SYNC_VERSION="${UPSTREAM_SYNC_VERSION#v}"

# set the app version in Chart.yaml
sed -i -E "s/^appVersion.*$/appVersion: ${UPSTREAM_SYNC_VERSION}/" "${CHART_DIR}/Chart.yaml"

# we need to reset the version field in Chart.yaml to match the
# latest release of this repo. So we fetch it with jq and then
# inject it back into the Chart.yaml.

LATEST_VERSION=$(curl -s https://api.github.com/repos/giantswarm/kubeedge-cloudcore-app/releases/latest | jq -r .name)
# remove leading 'v' if present
LATEST_VERSION="${LATEST_VERSION#v}"

# set the app version in Chart.yaml
sed -i -E "s/^version.*$/version: ${LATEST_VERSION}/" "${CHART_DIR}/Chart.yaml"

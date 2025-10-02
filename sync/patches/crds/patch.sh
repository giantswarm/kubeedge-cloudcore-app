#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir

cd "${repo_dir}"

cp -r "${script_dir}"/manifests/* ./helm/kubeedge-cloudcore/
cp ./vendor/kubeedge-cloudcore/manifests/charts/cloudcore/crds/* ./helm/kubeedge-cloudcore/charts/kubeedge-cloudcore-crds/templates/

# update the crd Chart.yaml if the CRDs have changed
CRDS_CHANGED=0
CHART_DIR="./helm/kubeedge-cloudcore/charts/kubeedge-cloudcore-crds"
CRDS_DIR="./helm/kubeedge-cloudcore/charts/kubeedge-cloudcore-crds/templates"

# check for updated CRDs
if ! git diff --quiet HEAD -- "${CRDS_DIR}"; then
    CRDS_CHANGED=1
fi

# check for new CRDs
if git ls-files --others --exclude-standard -- "${CRDS_DIR}" | grep -q .; then
    CRDS_CHANGED=1
fi

# get the current version of the upstream cloudcore chart and update the crd chart version
if [[ $CRDS_CHANGED -eq 1 ]]; then
    UPSTREAM_VERSION=$(grep '^version:' vendor/kubeedge-cloudcore/manifests/charts/cloudcore/Chart.yaml | awk '{print $2}')
    sed -i -E "s/^(version: ).*/\1${UPSTREAM_VERSION}/" "${CHART_DIR}/Chart.yaml"

    # add annotation to ensure helm doesn't delete CRDs
    for crd in "${CRDS_DIR}"/*; do
        # this command ensures that the annotations field exists and then adds the helm annotation. it does not remove any existing annotations.
        yq eval '.metadata.annotations = (.metadata.annotations // {} ) | .metadata.annotations += {"helm.sh/resource-policy": "keep"}' -i "${crd}"
    done
fi

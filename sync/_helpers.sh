# shellcheck shell=bash

# root dir of the git repository
REPO_DIR=$(git rev-parse --show-toplevel) ; readonly REPO_DIR

SCRIPT_DIR_REL=".${SCRIPT_DIR#"${REPO_DIR}"}" ; readonly SCRIPT_DIR_REL

# root dir of the generated helm chart
CHART_DIR="${REPO_DIR}/helm/kubeedge-cloudcore" ; readonly CHART_DIR

# root dir of the CRD dependency chart
CRD_CHART_DIR="${REPO_DIR}/helm/kubeedge-cloudcore/charts/kubeedge-cloudcore-crds" ; readonly CRD_CHART_DIR

# root dir of the vendir synced chart
VENDIR_SYNC_DIR="${REPO_DIR}/vendor/kubeedge-cloudcore/manifests/charts/cloudcore" ; readonly VENDIR_SYNC_DIR

# used by sync/changelog.sh to add the upstream chart name to the changelog entry.
UPSTREAM_NAME="cloudcore" ; readonly UPSTREAM_NAME

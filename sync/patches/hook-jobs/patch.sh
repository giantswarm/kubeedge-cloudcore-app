#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh

mkdir "${CHART_DIR}"/templates/hook-jobs
cp -r "${SCRIPT_DIR}"/manifests/* "${CHART_DIR}"/templates/hook-jobs/

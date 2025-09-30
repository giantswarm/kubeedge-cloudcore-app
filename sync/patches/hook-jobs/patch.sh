#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir

cd "${repo_dir}"

mkdir ./helm/kubeedge-cloudcore/templates/hook-jobs
cp -r "${script_dir}"/manifests/* ./helm/kubeedge-cloudcore/templates/hook-jobs/

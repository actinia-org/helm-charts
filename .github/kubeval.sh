#!/bin/bash
set -euo pipefail

CHARTS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts)"

# prevent pipefail if no changes in charts
if [ "$(echo ${CHARTS} | grep '[cC]hart.yaml')" != "" ]
then
  CHART_DIRS="$(echo ${CHARTS} | grep '[cC]hart.yaml' | sed -e 's#/[Cc]hart.yaml##g')"
else
  CHART_DIRS=""
fi

KUBEVAL_VERSION="0.14.0"
SCHEMA_LOCATION="https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/"

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
tar -xf /tmp/kubeval.tar.gz kubeval

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  if [ -d $CHART_DIR ] && [ -f $CHART_DIR/Chart.yaml ]
  then
    echo "Validating $CHART_DIR"
    (cd $CHART_DIR && helm dep up)
    helm template "${CHART_DIR}" | ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
  fi
done

#! /bin/bash

set -ex

ROOT="$(git rev-parse --show-toplevel)"
# Default to short SHA if release version not set.
export RELEASE_VERSION=${RELEASE_VERSION:-"$(git rev-parse --short HEAD)"}

export KO_DOCKER_REPO=${KO_DOCKER_REPO:-"ko.local"}

RELEASE_DIR="${ROOT}/release"
# Apply templated values from environment.
envsubst < ${RELEASE_DIR}/kustomization.yaml | tee ${RELEASE_DIR}/kustomization.yaml  

# Apply kustomiation + build images + generate yaml
kubectl kustomize ${RELEASE_DIR} | ko resolve -P -f - -t ${RELEASE_VERSION} > ${RELEASE_DIR}/release.yaml

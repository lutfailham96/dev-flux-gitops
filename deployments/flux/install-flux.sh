#!/bin/bash

REPO_NAME=dev-flux-gitops
CLUSTER_NAME=dev-cluster

# required for authentication
export GITHUB_TOKEN=
export GITHUB_USER=

# check pre-requisites kubernetes cluster
flux check --pre

# bootstrap flux to cluster
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=$REPO_NAME \
  --branch=main \
  --path=./clusters/$CLUSTER_NAME \
  --personal

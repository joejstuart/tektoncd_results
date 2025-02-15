# Results E2E tests

## Quickstart

```sh
$ ./00-setup.sh
$ ./01-install.sh
$ go test --tags=e2e .
```

## Dependencies

- git
- kubectl
- ko (>= v0.6.2)
- kind
- jq

## Scripts

This folder contains several scripts, useful for testing e2e workflows:

### `00-setup.sh`

Sets up a local kind cluster, and configures your local kubectl context to use
this environment.

| Environment variable | Description              | Default               |
| -------------------- | ------------------------ | --------------------- |
| KIND_CLUSTER_NAME    | KIND cluster name to use | tekton-results        |
| KIND_IMAGE           | KIND node image to use   | kindest/node:v1.17.11 |

### `01-install.sh`

Installs Tekton Pipelines and Results components. Results is always installed
from the local repo.

All components are installed to the current kubectl context
(`kubectl config current-context`).

This can safely be ran multiple times, and should be ran anytime a change is
made to Results components.

| Environment variable   | Description                                                             | Default                                                                     |
| ---------------------- | ----------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| KO_DOCKER_REPO         | Docker repository to use for ko                                         | kind.local                                                                  |
| TEKTON_PIPELINE_CONFIG | Tekton Pipelines config source (anything `kubectl apply -f` compatible) | https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml |

## Running the tests

Once you have configured your local client, you can run the tests by running:

```sh
$ go test --tags=e2e .
```
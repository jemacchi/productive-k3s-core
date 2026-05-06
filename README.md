# Productive-k3s

A simple way to bootstrap, validate, and operate a production-oriented `k3s` stack on a supported single host or VM.

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache--2.0-yellow.svg)](./LICENSE)
![Ubuntu 24.04](https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?logo=ubuntu&logoColor=white)
![Ubuntu 22.04](https://img.shields.io/badge/Ubuntu-22.04%20LTS-E95420?logo=ubuntu&logoColor=white)
![Debian 13](https://img.shields.io/badge/Debian-13%20trixie-A81D33?logo=debian&logoColor=white)
![Debian 12](https://img.shields.io/badge/Debian-12%20bookworm-A81D33?logo=debian&logoColor=white)

The stack includes:

- `cert-manager`
- `Longhorn`
- `Rancher`
- internal registry
- host NFS export

Bootstrap modes:

- `single-node`: install the base node and optionally the full stack on the same machine
- `server`: install only the base server bootstrap components
- `agent`: join a node to an existing K3S server
- `stack`: install or reuse stack components on top of an existing cluster

## Documentation

The long-form documentation lives under [`docs/`](./docs/) and is published as the project site. The English source tree is the best reference for repository usage and should stay aligned with this README.

Start here:

- [Product overview](./docs/src/en/product/index.md)
- [User docs](./docs/src/en/user-docs/index.md)
- [Developer docs](./docs/src/en/developer-docs/index.md)

## Product

Use these pages for the high-level product view instead of repeating the same rationale in the README:

- [How to use Productive K3S](./docs/src/en/product/how-to-use.md)
- [Reasons behind the stack](./docs/src/en/product/reasons-behind.md)
- [Supported platforms](./docs/src/en/product/supported-platforms.md)
- [Relationship with Productive K3S Infra](./docs/src/en/product/productive-k3s-infra-relationship.md)

## User Docs

Operational checks and user-facing references:

- [k3s checks](./docs/src/en/user-docs/k3s-checks.md)
- [Ingress checks](./docs/src/en/user-docs/ingress-checks.md)
- [Rancher checks](./docs/src/en/user-docs/rancher-checks.md)
- [Registry checks](./docs/src/en/user-docs/registry-checks.md)
- [Longhorn checks](./docs/src/en/user-docs/longhorn-checks.md)
- [Certificate checks](./docs/src/en/user-docs/certificate-checks.md)
- [Longhorn single-node notes](./docs/src/en/user-docs/longhorn-single-node-notes.md)
- [Privacy and telemetry](./docs/src/en/user-docs/privacy-and-telemetry.md)

## Developer Docs

Repository references and maintainer guidance:

- [Make targets for development](./docs/src/en/developer-docs/make-targets.md)
- [Productive K3S modes](./docs/src/en/developer-docs/productive-k3s-modes.md)
- [Scripts parameters](./docs/src/en/developer-docs/script-parameters.md)
- [GitHub Actions and release automation](./docs/src/en/developer-docs/github-actions.md)
- [macOS development](./docs/src/en/developer-docs/guides/macos-development.md)
- [Windows development](./docs/src/en/developer-docs/guides/windows-development.md)
- [Post-development testing](./docs/src/en/developer-docs/guides/post-development-testing.md)
- [Ubuntu 24.04 supported platform](./docs/src/en/developer-docs/ubuntu-24-04-supported.md)
- [Ubuntu 22.04 supported platform](./docs/src/en/developer-docs/ubuntu-22-04-supported.md)
- [Debian 13 supported platform](./docs/src/en/developer-docs/debian-13-supported.md)
- [Debian 12 supported platform](./docs/src/en/developer-docs/debian-12-supported.md)

## Practical Summary

If you only want to install and operate the stack locally, the practical host-side prerequisites are:

- Linux host with `systemd`
- `bash`
- `sudo`
- `curl`
- `getent`
- `make`

If you also want full repository validation coverage, add:

- `docker`
- `multipass`
- `jq`

See the linked docs pages above for details, platform notes, and validation expectations.

## License

This project is licensed under the Apache License 2.0.

See [LICENSE](./LICENSE).

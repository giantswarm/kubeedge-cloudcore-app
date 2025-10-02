# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2025-10-02

### Added

- Add initial vendir sync of upstream chart at v1.21.0.
- Improve vendir sync config.
- Add hook jobs to configure Cilium to work with KubeEdge.
- Extend Service and convert it to a Helm hook.
- Add a pre-install hook job to get Service IP and inject it into the cloudcore configmap.
- Add Giant Swarm PolicyException.
- Add JSON schema and chart README.
- Patch all CRDs to ensure they cannot be deleted by Helm.
- Add CRD subchart as a dependency to satisfy the linter.

[Unreleased]: https://github.com/giantswarm/kubeedge-cloudcore-app/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/giantswarm/kubeedge-cloudcore-app/releases/tag/v0.1.0

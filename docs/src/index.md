---
title: Productive K3S
template: home.html
hide:
  - navigation
  - toc
eyebrow: Single-node Kubernetes, done right
hero_title: Productive K3S
lead: Productive K3S provides a simple way to run a production-like Kubernetes environment on a single virtual machine.
sublead: It is designed for teams that want to adopt Kubernetes practices without the operational overhead and cost of managing a full multi-node cluster.
primary_label: View on GitHub
primary_url: https://github.com/jemacchi/productive-k3s
secondary_label: Open README
secondary_url: https://github.com/jemacchi/productive-k3s/blob/main/README.md
card_title: What it does
card_items:
  - Deploys a single-node k3s cluster on a standard VM
  - Provides a Kubernetes-compatible environment out of the box
  - Enables real workloads using manifests, Helm charts, and Kubernetes-native tooling
why_title: Why it exists
why_options:
  - label: Option 1
    text: A single VM with Docker Compose is simple, but not Kubernetes.
  - label: Option 2
    text: A full Kubernetes cluster is powerful, but complex and costly.
bridge_note: Productive K3S bridges that gap.
bridge_points:
  - Work with Kubernetes from day one
  - Keep infrastructure simple, just one VM
  - Avoid premature complexity
use_cases_title: Target use cases
use_cases:
  - Small teams and startups
  - Early-stage platforms
  - Cost-sensitive environments
  - Development and lightweight production workloads
principles_title: Design principles
principles:
  - title: Keep it simple
    text: single host, minimal setup
  - title: Stay Kubernetes-native
    text: no abstractions over k8s
  - title: Be migration-ready
    text: workloads can move to a real cluster later
environments_title: Supported environments
environments:
  - Ubuntu LTS
  - Debian 12 and Debian 13
  - Linux hosts and virtual machines used in development, validation, and small production-style setups
  - Optimized for standard cloud virtual machines across providers like AWS, GCP, and DigitalOcean.
not_title: What it is not
not_items:
  - Not a replacement for managed Kubernetes services such as EKS, GKE, or AKS
  - Not a multi-tenant platform
  - Not an excuse to skip production operational discipline
not_note: Instead, it is a pragmatic entry point into Kubernetes.
---

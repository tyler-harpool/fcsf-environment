# Deploy development (CICD) environment
This repository contains the Kubernetes configurations for managing various components using Kustomize. The components include ArgoCD, External Secrets, Spin, and Vault.

## Get Started

`kubectl apply -k bootstrap`


## Components


### Bootstrap

The bootstrap directory contains the initial configurations for setting up the environment.

### ArgoCD

ArgoCD is used for continuous delivery and GitOps. The configurations are organized into base and overlay directories.


### Spin
SpinKube is an open source project that streamlines developing, deploying and operating WebAssembly workloads in Kubernetes - resulting in delivering smaller, more portable applications and incredible compute performance benefits.


### Vault

Vault is used for managing secrets.

### Kustomize Generator

The kustomize-generator directory contains scripts and tools for generating Kustomize configurations.
- `./kustomize-generator`


## Troubleshooting
### Stuck terminating?
- Use with caution.
```bash
kubectl patch crd applications.argoproj.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl delete crd applications.argoproj.io --force --grace-period=0
```

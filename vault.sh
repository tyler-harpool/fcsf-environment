#!/bin/bash
# setup-vault.sh

# Add the Hashicorp Helm repository
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update

# Create directories if they don't exist
mkdir -p base/vault/base/rendered

# Render the Helm chart
helm template vault hashicorp/vault \
  --version 0.29.0 \
  --namespace vault \
  --values base/vault/base/values.yaml \
  > base/vault/base/rendered/vault.yaml

# Apply the configuration
kubectl apply -k base/vault/overlays/local

# Wait for vault pod to be ready
echo "Waiting for Vault pod to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=vault -n vault --timeout=300s

echo "Vault deployment complete. Don't forget to initialize and unseal Vault:"
echo "kubectl exec -n vault vault-0 -- vault operator init"

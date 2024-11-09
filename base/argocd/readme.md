## ArgoCD
## Networking
- `kubectl apply -f argocd-cmd-params-cm.yaml`
- `kubectl apply -f ../../network/traefik/ingress.yaml`
- visit: http://argocd.rancher.localhost/
## WebUI
- Get the password for the initial admin user
IGNORE THE PERCENTAGE SIGN % at the end of the command.
- `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

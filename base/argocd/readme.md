# ArgoCD
## WebUI
- Get the password for the initial admin user
IGNORE THE PERCENTAGE SIGN % at the end of the command.
- `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo \n`

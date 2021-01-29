# AAD Pod Identity

AAD Pod Identity enables Kubernetes applications to access cloud resources securely with [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/).

## Deploy `aad-pod-identity` using [Helm 3](https://v3.helm.sh/):

```bash
$ helm repo add aad-pod-identity https://raw.githubusercontent.com/Azure/aad-pod-identity/master/charts
$ helm install aad-pod-identity -f aad-config.yaml aad-pod-identity/aad-pod-identity -n kube-system
```
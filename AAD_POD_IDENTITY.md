# AAD Pod Identity

AAD Pod Identity enables Kubernetes applications to access cloud resources securely with [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/).

## Getting Started!

To integrate the AKS cluster with AAD Pod Idenity, you'll also need to assign necessary roles such as "Managed Identity Operator" to the AKS agent pool

For simplify your work, you can use our "user_assigned_identity_role_assignment" terraform module in "provision/components/user_assigned_identity_role_assignment" folder

```sh
$ cd provision/components/user_assigned_identity_role_assignment
```

Prepare your tfvars file [terraform config file] like "develop.tfvars", then run "terraform init" command to initialize terraform module

```sh
$ terraform init
```

followed by the below command to verify the config

```sh
$ terraform plan -var-file=[your tfvars file]
```

then, run the below command to assign the roles to the AKS agent pool

```sh
$ terraform apply -var-file=[your tfvars file]
```

After you have assigned the roles to the AKS agent pool already, you can now deploy "AAD Pod Identity"

Deploy `AAD Pod Identity` using [Helm 3](https://v3.helm.sh/):

```bash
$ helm repo add aad-pod-identity https://raw.githubusercontent.com/Azure/aad-pod-identity/master/charts
$ helm install aad-pod-identity -f aad-pod-identity/config/values.yaml aad-pod-identity/aad-pod-identity -n kube-system
```
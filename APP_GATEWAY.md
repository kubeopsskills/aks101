# App Gateway Ingress Controller (AGIC)

The App Gateway Ingress Controller (AGIC) is a pod within your Kubernetes cluster. AGIC monitors the Kubernetes Ingress resources, and creates and applies App Gateway config based on these.

## Prerequisites

- [AAD Pod Identity](AAD_POD_IDENTITY.md)
- an App Gateway in the AKS Cluster Node Resource Group (Prefix with MC_*)
- an App Gateway User Assigned Identity
## Getting Started!

To provision a new AGIC, you also need to have provisioned an App Gateway in the AKS cluster node resource group and an App Gateway User Assigned Identity

Preparing config for a new App Gateway

```sh
$ cd provision/components/app_gateway
```

Prepare your tfvars file [terraform config file] like "develop.tfvars", then run "terraform init" command to initialize terraform module

```sh
$ terraform init
```

followed by the below command to verify the config

```sh
$ terraform plan -var-file=[your tfvars file]
```

then, run the below command to provision a new App Gateway

```sh
$ terraform apply -var-file=[your tfvars file]
```

After you have provisioned the new App Gateway, you will provision an App Gateway User Assigned Identity

Preparing config for an App Gateway User Assigned Identity

```sh
$ cd ../user_assigned_identity
```

Prepare your tfvars file [terraform config file] like "develop.tfvars", then run "terraform init" command to initialize terraform module

```sh
$ terraform init
```

followed by the below command to verify the config

```sh
$ terraform plan -var-file=[your tfvars file]
```

then, run the below command to provision an App Gateway User Assigned Identity

```sh
$ terraform apply -var-file=[your tfvars file]
```

After you have provisioned the App Gateway User Assigned Identity, you can now deploy "AGIC"

You can use [Cloud Shell](https://shell.azure.com/) to install the AGIC Helm package:

1. Add the `application-gateway-kubernetes-ingress` helm repo and perform a helm update

    ```bash
    helm repo add application-gateway-kubernetes-ingress https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/
    helm repo update
    ```

1. Download [helm-config.yaml](../examples/sample-helm-config.yaml), which will configure AGIC:
    ```bash
    wget https://raw.githubusercontent.com/Azure/application-gateway-kubernetes-ingress/master/docs/examples/sample-helm-config.yaml -O helm-config.yaml
    ```

1. Edit [helm-config.yaml](../examples/sample-helm-config.yaml) and fill in the values for `appgw` and `armAuth`.
    ```bash
    vi helm-config.yaml
    ```

    **NOTE:** The `<identityResourceId>` and `<identityClientId>` are the properties of the Azure AD Identity you setup in the previous section. You can retrieve this information by running the following command: `az identity show -g <resourcegroup> -n <identity-name>`, where `<resourcegroup>` is the resource group in which the top level AKS cluster object, Application Gateway and Managed Identify are deployed.

1. Install Helm chart `application-gateway-kubernetes-ingress` with the `helm-config.yaml` configuration from the previous step

    ```bash
    helm install ingress-azure \
      -f helm-config.yaml \
      application-gateway-kubernetes-ingress/ingress-azure \
      --version 1.3.0 -n kube-system
    ```

    >Note: Use at least version 1.2.0-rc3, e.g. `--version 1.2.0-rc3`, when installing on k8s version >= 1.16

    Alternatively you can combine the `helm-config.yaml` and the Helm command in one step:
    ```bash
    helm install ingress-azure application-gateway-kubernetes-ingress/ingress-azure \
         --namespace default \
         --debug \
         --set appgw.name=applicationgatewayABCD \
         --set appgw.resourceGroup=your-resource-group \
         --set appgw.subscriptionId=subscription-uuid \
         --set appgw.usePrivateIP=false \
         --set appgw.shared=false \
         --set armAuth.type=servicePrincipal \
         --set armAuth.secretJSON=$(az ad sp create-for-rbac --sdk-auth | base64 -w0) \
         --set rbac.enabled=true \
         --set verbosityLevel=3 \
         --set kubernetes.watchNamespace=default \
         --version 1.3.0
    ```

    >Note: Use at least version 1.2.0-rc3, e.g. `--version 1.2.0-rc3`, when installing on k8s version >= 1.16

1. Check the log of the newly created pod to verify if it started properly

Refer to the [tutorials](../tutorials/tutorial.general.md) to understand how you can expose an AKS service over HTTP or HTTPS, to the internet, using an Azure App Gateway.
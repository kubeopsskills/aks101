# AKS 101 Terraform Workshop

This is an AKS 101 Terraform Workshop.

## Getting Started!

To setup a new AKS cluster, you need to clone the git repo

```sh
$ git clone https://github.com/kubeopsskills/aks101.git
$ cd aks101
```

Preparing config for AKS foundation network

```sh
$ cd provision/components/foundation_network_aks
```

Prepare your tfvars file [terraform config file] like "develop.tfvars", then run "terraform init" command to initialize terraform module

```sh
$ terraform init
```

followed by the below command to verify the config

```sh
$ terraform plan -var-file=[your tfvars file]
```

then, run the below command to provision the AKS foundation network

```sh
$ terraform apply -var-file=[your tfvars file]
```

After you have provisioned the AKS foundation network already, you can now provision your new AKS cluster

Preparing config for the AKS cluster

```sh
$ cd ../aks_cluster
```

Prepare your tfvars file [terraform config file] like "develop.tfvars", then run "terraform init" command to initialize terraform module

```sh
$ terraform init
```

followed by the below command to verify the config

```sh
$ terraform plan -var-file=[your tfvars file]
```

then, run the below command to provision the new AKS cluster

```sh
$ terraform apply -var-file=[your tfvars file]
```

Waiting for 2-3 minutes and run the following commands to verify if the new AKS cluster has been created successfully

Get Admin Kubernetes Config

```sh
$ az aks get-credentials --name [your_aks_cluster_name] --resource-group [your_aks_cluster_resource_group] --admin
```

Get Pods

```sh
$ kubectl get pods
```

You'll got the result

```sh
sirinatpaphatsirinatthi@Sirinats-MacBook-Pro aks101 % kubectl get po 

No resources found in default namespace.
```

*** Note:

You might double run "terraform apply" command to pass the new AKS cluster provision step, as "Terraform Azure AD Application" module doesn't support granting admin consent for Azure directory right now.

# References:
- https://github.com/Azure/aad-pod-identity
- https://github.com/Azure/application-gateway-kubernetes-ingress
- https://docs.microsoft.com/en-us/azure/aks/azure-ad-integration-cli

# Copyright

<a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://licensebuttons.net/l/by-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
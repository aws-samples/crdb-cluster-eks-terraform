# Deploy CRDB Cluster In EKS Terraform

[CockroachDB](https://www.cockroachlabs.com/docs/stable/) is a distributed SQL database that aims to make it simple to build, deploy, and operate globally-scaled applications. It is designed to be highly available, survive data center outages, and maintain consistent performance across a geographically distributed database cluster.

One of the key features of CockroachDB is its ability to automatically shard data across multiple nodes in a cluster, allowing it to scale horizontally as more nodes are added.  


## Table of Contents
1. [About this Repo](#about)
2. [Requirements](#requirements)
3. [Target architecture](#architecture)
4. [How to install](#install)
5.  [References](#references)
6. [Related Resources](#resources)


## About this Repo <a name="about"></a>
This repo provides a Terraform Module that can be used to deploy CRDB  multi node database cluster in a single EKS cluster using [CockroachDB Kubernetes Operator](https://github.com/cockroachdb/cockroach-operator). It his also uses [cert-manager](https://cert-manager.io/)  to secure node communication with TLS certificate.


## Requirements <a name="requirements"></a>

-   An active AWS account with required permission to deploy resources in Kubernetes cluster    
-   A running EKS cluster with version v1.23+ , EKS Node should have kubernets label `node=cockroachdb`    
-   EBS CSI Driver v1.19.0+ installed in the EKS cluster    
-   An Understanding of [Terraform](https://developer.hashicorp.com/terraform/docs) and usage.    
-   [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) with version 1.0.0+    
-   Install [Kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.htm)    
-   [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) v2.9.18+    
-   A web browser that is supported for use with the AWS Management Console. ([See the list of supported browsers](https://aws.amazon.com/premiumsupport/knowledge-center/browsers-management-console/))

## Target architecture <a name="architecture"></a>
![Image](https://vzm39wj0ik.execute-api.us-east-1.amazonaws.com/v1/contents/e22d81ab-b85c-4709-8579-4c9cdb4afdb6/images/054dc293-a331-4ef3-9d12-1659eef2f76f.png)

## How to install <a name="install"></a>

### Setup	

 - git clone   https://github.com/aws-samples/crdb-cluster-eks-terraform.git
 - Open variable.tf under main folder.
 - Configure Installation Region, EKS Cluster Name, Number of Nodes to be deployed.

### Install 

 - terraform init 
 - terraform apply

### Verification

 - Verify if kubectl is installed. Follow instructions to install
   [kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
```
kubectl version
```
-   Set the eks context using aws cli
    

```
aws eks update-kubeconfig —name <eks_cluster_name>
```

-   Verify number of CRDB pods using
    
    ```
    kubectl get pods -n <namespace>
    ```
    

```
NAME                                  READY   STATUS    RESTARTS   AGE
cockroach-operator-655fbf7847-zn9v8   1/1     Running   0          30m
cockroachdb-0                         1/1     Running   0          24m
cockroachdb-1                         1/1    Running   0          24m
cockroachdb-2                         1/1     Running   0          24m
cockroachdb-3                         1/1     Running   0          30s
```

-   4 cockroach dB pods will be running as the default value in the variable.tf is set to 4. This may vary based on the value set on variable.tf file.
    

**Scale up/down:**

-   Increase/decrease the number of nodes for managed node group in ./main/variable.tf and perform
    

```
terraform apply 
```

-   once apply is successful, now verify the number of CRDB pods using
    

```
kubectl get pods -n <namespace>
```

-   Now crdb pods will scale in or out based on the value and corresponds to managed node group due to affinity rules.
    
    ```
    NAME                                  READY   STATUS    RESTARTS   AGE
    cockroach-operator-655fbf7847-zn9v8   1/1     Running   0          30m
    cockroachdb-0                         1/1     Running   0          24m
    cockroachdb-1                         1/1    Running   0          24m
    cockroachdb-2                         1/1     Running   0          24m
    cockroachdb-3                         1/1     Running   0          30s
    cockroachdb-4                         1/1     Running   0          30s
    ```
### Clean Up
To tear down, run

```
terraform destroy
```

## References <a name="references"></a>

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.66.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_common-tags"></a> [common-tags](#module\_common-tags) | ../modules/common-tags | n/a |
| <a name="module_crdb"></a> [crdb](#module\_crdb) | ../modules/crdb | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name of the EKS Cluster | `string` | `"demo2"` | no |
| <a name="input_number_of_nodes"></a> [number\_of\_nodes](#input\_number\_of\_nodes) | Number of nodes to be deployed | `number` | `4` | no |
| <a name="input_region"></a> [region](#input\_region) | set the region for deployment | `string` | `"us-east-2"` | no |

## Outputs

No outputs.


## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.


## License

* [License](./LICENSE.txt)

## Related Resources <a name="resources"></a>

-   [EKS Getting started](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)
    
-   [Installing Kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
    
-   [Install CRDB on single cluster](https://www.cockroachlabs.com/docs/dev/deploy-cockroachdb-with-kubernetes.html)
    
-   [Install CRDB on multi cluster](https://www.cockroachlabs.com/docs/dev/orchestrate-cockroachdb-with-kubernetes-multi-cluster.html)
    
-   [Terraform installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
    
-   [Terraform remote state management](https://www.terraform.io/language/settings/backends/configuration)
    
-   [Terraform AWS Provider - Documentation and Usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
    
-   [EKS setup](https://aws.amazon.com/premiumsupport/knowledge-center/eks-alb-ingress-controller-fargate/)
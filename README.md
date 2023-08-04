## Requirements

No requirements.

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
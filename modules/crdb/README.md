## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.14.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >= 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | >= 0.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.cert](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.client](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.crd](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.database](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.nlb](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.node_certificate](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.operator](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_storage_class.gp3](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class) | resource |
| [local_file.cluster_settings](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.cluster_settings](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [time_sleep.database_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.operator_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_eks_cluster.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [template_file.certificate_file](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.client](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.cluster_settings](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.database](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.nlb](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.node_certificate](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.operator](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | additional tags for resources in AWS | `map(any)` | n/a | yes |
| <a name="input_admission_kv_enabled"></a> [admission\_kv\_enabled](#input\_admission\_kv\_enabled) | n/a | `string` | `"false"` | no |
| <a name="input_admission_sql_kv_response_enabled"></a> [admission\_sql\_kv\_response\_enabled](#input\_admission\_sql\_kv\_response\_enabled) | n/a | `string` | `"false"` | no |       
| <a name="input_admission_sql_sql_response_enabled"></a> [admission\_sql\_sql\_response\_enabled](#input\_admission\_sql\_sql\_response\_enabled) | n/a | `string` | `"false"` | no |    
| <a name="input_apply_cluster_settings"></a> [apply\_cluster\_settings](#input\_apply\_cluster\_settings) | n/a | `bool` | `false` | no |
| <a name="input_certificate_manifest_directory"></a> [certificate\_manifest\_directory](#input\_certificate\_manifest\_directory) | n/a | `string` | `""` | no |
| <a name="input_client_manifest_file"></a> [client\_manifest\_file](#input\_client\_manifest\_file) | n/a | `string` | `""` | no |
| <a name="input_cluster_organization"></a> [cluster\_organization](#input\_cluster\_organization) | n/a | `string` | `"apg_data_delivery"` | no |
| <a name="input_cluster_settings_file"></a> [cluster\_settings\_file](#input\_cluster\_settings\_file) | n/a | `string` | `""` | no |
| <a name="input_cpu_limit"></a> [cpu\_limit](#input\_cpu\_limit) | n/a | `string` | `"1"` | no |
| <a name="input_cpu_requests"></a> [cpu\_requests](#input\_cpu\_requests) | n/a | `string` | `"560m"` | no |
| <a name="input_crd_manifest_file"></a> [crd\_manifest\_file](#input\_crd\_manifest\_file) | n/a | `string` | `""` | no |
| <a name="input_crdb_version"></a> [crdb\_version](#input\_crdb\_version) | n/a | `string` | `"v22.2.2"` | no |
| <a name="input_database_manifest_file"></a> [database\_manifest\_file](#input\_database\_manifest\_file) | n/a | `string` | `""` | no |
| <a name="input_deploy_client"></a> [deploy\_client](#input\_deploy\_client) | Select true to deploy the secure client Pod, else select false | `bool` | `true` | no |
| <a name="input_domainname"></a> [domainname](#input\_domainname) | variable "crdb\_cluster" { description = "The name appended to the crdb cluster statefulset" type        = string default     = "shared" } | `string` | `"cloud.aws.apgsecurity.com"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | n/a | `string` | `""` | no |
| <a name="input_kv_snapshot_rebalance_max_rate"></a> [kv\_snapshot\_rebalance\_max\_rate](#input\_kv\_snapshot\_rebalance\_max\_rate) | n/a | `string` | `"64 MiB"` | no |
| <a name="input_kv_snapshot_recovery_max_rate"></a> [kv\_snapshot\_recovery\_max\_rate](#input\_kv\_snapshot\_recovery\_max\_rate) | n/a | `string` | `"64 MiB"` | no |
| <a name="input_max-disk-temp-storage"></a> [max-disk-temp-storage](#input\_max-disk-temp-storage) | n/a | `string` | `"32GiB"` | no |
| <a name="input_max_sql_memory"></a> [max\_sql\_memory](#input\_max\_sql\_memory) | n/a | `string` | `"18%"` | no |
| <a name="input_memory_limit"></a> [memory\_limit](#input\_memory\_limit) | n/a | `string` | `"3Gi"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `""` | no |
| <a name="input_nlb_manifest_file"></a> [nlb\_manifest\_file](#input\_nlb\_manifest\_file) | n/a | `string` | `""` | no |
| <a name="input_node_certificate_file"></a> [node\_certificate\_file](#input\_node\_certificate\_file) | n/a | `string` | `""` | no |
| <a name="input_number_of_nodes"></a> [number\_of\_nodes](#input\_number\_of\_nodes) | n/a | `number` | `3` | no |
| <a name="input_operator_manifest_directory"></a> [operator\_manifest\_directory](#input\_operator\_manifest\_directory) | n/a | `string` | `""` | no |
| <a name="input_persistent_volume_size"></a> [persistent\_volume\_size](#input\_persistent\_volume\_size) | n/a | `string` | `"60Gi"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_remory_request"></a> [remory\_request](#input\_remory\_request) | n/a | `string` | `"2Gi"` | no |
| <a name="input_server_time_until_store_dead"></a> [server\_time\_until\_store\_dead](#input\_server\_time\_until\_store\_dead) | n/a | `string` | `"10m0s"` | no |
| <a name="input_sql_log_slow_query_latency_threshold"></a> [sql\_log\_slow\_query\_latency\_threshold](#input\_sql\_log\_slow\_query\_latency\_threshold) | n/a | `string` | `"10s"` | no |
| <a name="input_sql_stats_persisted_rows_max"></a> [sql\_stats\_persisted\_rows\_max](#input\_sql\_stats\_persisted\_rows\_max) | n/a | `string` | `"2000"` | no |

## Outputs

No outputs.
variable "deploy_client" {
  description = "Select true to deploy the secure client Pod, else select false"
  type        = bool
  default     = true
}
variable "crd_manifest_file" {
  description = "YAML manifests file to create custom resource."
  type        = string
  default     = ""
}
variable "certificate_manifest_directory" {
  description = "YAML manifests file to create a certificate resources."
  type        = string
  default     = ""
}
variable "database_manifest_file" {
  description = "YAML manifests file to create a crdb cluster resources."
  type        = string
  default     = ""
}
variable "nlb_manifest_file" {
  description = "YAML manifests file to create a network loadbalancer resources."
  type        = string
  default     = ""
}
variable "client_manifest_file" {
  description = "YAML manifests file to create cockroachdb pod/container resources."
  type        = string
  default     = ""
}
variable "operator_manifest_directory" {
  description = "directory containing manifest resources"
  type        = string
  default     = ""
}
variable "namespace" {
  description = "Namespace name for resource creation"
  type        = string
  default     = ""
}
# variable "crdb_cluster" {
#   description = "The name appended to the crdb cluster statefulset"
#   type        = string
#   default     = "shared"
# }
variable "domainname" {
  description = "Describes domain name value as part of nlb"
  type        = string
  default     = "cloud.aws.apgsecurity.com"
}
variable "region" {
  description = "Describes the region for the resources to be created"
  type        = string
  default     = "us-east-1"
}
variable "number_of_nodes" {
  description = "Describes the minimum number of nodes required by cluster"
  type        = number
  default     = 3
}
variable "cpu_limit" {
  description = "Describes the sum of the CPU limit for all the Containers in the Pod"
  type        = string
  default     = "1"
}
variable "cpu_requests" {
  description = "Describes the sum of the CPU requests for all the Containers in the Pod"
  type        = string
  default     = "560m"
}
variable "memory_limit" {
  description = "Describes the memory limit of a container"
  type        = string
  default     = "3Gi"
}
variable "memory_request" {
  description = "Describes the memory requests of a container"
  type        = string
  default     = "2Gi"
}
variable "max_sql_memory" {
  description = "Describes the maximum in-memory storage capacity available to store temporary data for SQL queries"
  type        = string
  default     = "18%"
}

variable "max-disk-temp-storage" {
  description = "Describes the maximum on-disk storage capacity available to store temporary data for SQL queries"
  type        = string
  default     = "32GiB"
}

variable "persistent_volume_size" {
  description = "Describes the storage capacity of each volume"
  type        = string
  default     = "60Gi"
}
variable "crdb_version" {
  description = "Describes the version details of cockroachdb"
  type        = string
  default     = "v22.2.2"
}
variable "additional_tags" {
  description = "Additional tags for resources in AWS"
  type        = map(any)
}
variable "node_certificate_file" {
  description = "YAML file for Certificate resource"
  type        = string
  default     = ""
}
variable "eks_cluster_name" {
  description = "Describes the name of the EKS Cluster"
  type        = string
  default     = ""
}
variable "cluster_settings_file" {
  description = "Custom file for Cluster settings"
  type        = string
  default     = ""
}
variable "sql_stats_persisted_rows_max" {
  description = "Describes maximum number of rows of statement and transaction activity that will be persisted in the system tables"
  type        = string
  default     = "2000"
}
variable "cluster_organization" {
  description = "Describes the org name"
  type        = string
  default     = "apg_data_delivery"
}
variable "sql_log_slow_query_latency_threshold" {
  description = "Describes the threshold to trigger anomaly detection and identification"
  type        = string
  default     = "10s"
}
variable "server_time_until_store_dead" {
  description = "Describes the time after which a store is considered dead when no new infomation"
  type        = string
  default     = "10m0s"
}
variable "admission_kv_enabled" {
  description = "When true, work performed by the KV layer is subject to admission control"
  type        = string
  default     = "false"
}
variable "admission_sql_kv_response_enabled" {
  description = "when true, work performed by the SQL layer when receiving a KV response is subject to admission control"
  type        = string
  default     = "false"
}
variable "admission_sql_sql_response_enabled" {
  description = "when true, work performed by the SQL layer when receiving a DistSQL response is subject to admission control"
  type        = string
  default     = "false"
}
variable "kv_snapshot_rebalance_max_rate" {
  description = "Describes the rate limit (bytes/sec) to use for rebalance and upreplication snapshots"
  type        = string
  default     = "64 MiB"
}
variable "kv_snapshot_recovery_max_rate" {
  description = "Describes the rate limit (bytes/sec) to use for recovery"
  type        = string
  default     = "64 MiB"
}
variable "apply_cluster_settings" {
  description = "When true, cluster custom settings are applied"
  type        = bool
  default     = false
}
variable "create_gp3_storage_class" {
  description = "When set to true, creates the gp3 storage class"
  type        = bool
  default     = true
}

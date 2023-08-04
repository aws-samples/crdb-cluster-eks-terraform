variable "deploy_client" {
  description = "Select true to deploy the secure client Pod, else select false"
  type        = bool
  default     = true
}
variable "crd_manifest_file" {
  type    = string
  default = ""
}
variable "certificate_manifest_directory" {
  type    = string
  default = ""
}
variable "database_manifest_file" {
  type    = string
  default = ""
}
variable "nlb_manifest_file" {
  type    = string
  default = ""
}
variable "client_manifest_file" {
  type    = string
  default = ""
}
variable "operator_manifest_directory" {
  type    = string
  default = ""
}
variable "namespace" {
  type    = string
  default = ""
}
# variable "crdb_cluster" {
#   description = "The name appended to the crdb cluster statefulset"
#   type        = string
#   default     = "shared"
# }
variable "domainname" {
  type    = string
  default = "cloud.aws.apgsecurity.com"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "number_of_nodes" {
  type    = number
  default = 3
}
variable "cpu_limit" {
  type    = string
  default = "1"
}
variable "cpu_requests" {
  type    = string
  default = "560m"
}
variable "memory_limit" {
  type    = string
  default = "3Gi"
}
variable "remory_request" {
  type    = string
  default = "2Gi"
}
variable "max_sql_memory" {
  type    = string
  default = "18%"
}

variable "max-disk-temp-storage" {
  type    = string
  default = "32GiB"
}

variable "persistent_volume_size" {
  type    = string
  default = "60Gi"
}
variable "crdb_version" {
  type    = string
  default = "v22.2.2"
}
variable "additional_tags" {
  description = "additional tags for resources in AWS"
  type        = map(any)
}
variable "node_certificate_file" {
  type    = string
  default = ""
}
variable "eks_cluster_name" {
  type    = string
  default = ""
}
variable "cluster_settings_file" {
  type    = string
  default = ""
}
variable "sql_stats_persisted_rows_max" {
  type    = string
  default = "2000"
}
variable "cluster_organization" {
  type    = string
  default = "apg_data_delivery"
}
variable "sql_log_slow_query_latency_threshold" {
  type    = string
  default = "10s"
}
variable "server_time_until_store_dead" {
  type    = string
  default = "10m0s"
}
variable "admission_kv_enabled" {
  type    = string
  default = "false"
}
variable "admission_sql_kv_response_enabled" {
  type    = string
  default = "false"
}
variable "admission_sql_sql_response_enabled" {
  type    = string
  default = "false"
}
variable "kv_snapshot_rebalance_max_rate" {
  type    = string
  default = "64 MiB"
}
variable "kv_snapshot_recovery_max_rate" {
  type    = string
  default = "64 MiB"
}
variable "apply_cluster_settings" {
  type    = bool
  default = false
}
module "crdb" {
  source                 = "../modules/crdb"
  namespace              = "prod"
  region                 = var.region
  eks_cluster_name       = var.eks_cluster_name
  number_of_nodes        = var.number_of_nodes
  cpu_limit              = "500m"
  cpu_requests           = "250m"
  memory_limit           = "1Gi"
  remory_request         = "512Mi"
  crdb_version           = "v22.1.11"
  max_sql_memory         = "18%"
  max-disk-temp-storage  = "32GiB"
  persistent_volume_size = "60Gi"
  additional_tags        = module.common-tags.tags
}

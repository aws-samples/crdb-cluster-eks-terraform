data "template_file" "cluster_settings" {
  template = file(local.cluster_settings_file)
  vars = {
    sql_stats_persisted_rows_max         = var.sql_stats_persisted_rows_max
    cluster_organization                 = var.cluster_organization
    sql_log_slow_query_latency_threshold = var.sql_log_slow_query_latency_threshold
    server_time_until_store_dead         = var.server_time_until_store_dead
    admission_kv_enabled                 = var.admission_kv_enabled
    admission_sql_kv_response_enabled    = var.admission_sql_kv_response_enabled
    admission_sql_sql_response_enabled   = var.admission_sql_sql_response_enabled
    kv_snapshot_rebalance_max_rate       = var.kv_snapshot_rebalance_max_rate
    kv_snapshot_recovery_max_rate        = var.kv_snapshot_recovery_max_rate
  }
}

data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = data.aws_eks_cluster.eks.name
}

resource "local_file" "kubeconfig" {
  filename        = pathexpand("~/.kube/config_jenkins")
  file_permission = 600
  content         = <<-CONFIG
    apiVersion: v1
    kind: Config
    clusters:
    - name: clustername
      cluster:
        server: ${data.aws_eks_cluster.eks.endpoint}
        certificate-authority-data: ${data.aws_eks_cluster.eks.certificate_authority.0.data}
    contexts:
    - name: crdb
      context:
        cluster: clustername
        user: username
    current-context: crdb
    users:
    - name: username
      user:
        token: ${data.aws_eks_cluster_auth.eks.token}
  CONFIG
}
resource "local_file" "cluster_settings" {
  filename        = pathexpand("~/cluster_settings.txt")
  file_permission = 600
  content         = data.template_file.cluster_settings.rendered
}

resource "null_resource" "cluster_settings" {
  depends_on = [
    kubectl_manifest.database,
    time_sleep.database_wait,
    local_file.cluster_settings,
    kubectl_manifest.client
  ]

  provisioner "local-exec" {
    command = "if kubectl --kubeconfig ~/.kube/config_jenkins --context crdb exec -it cockroachdb-client-secure --namespace ${local.namespace} -- ./cockroach sql --certs-dir=/cockroach/cockroach-certs --host=cockroachdb-public.${local.namespace} < ${local_file.cluster_settings.filename}; then echo cluster settings applied ; else echo CRDBDB is not ready for the cluster settings to be applied;fi"
  }
  triggers = {
    everytime = timestamp()
  }
}


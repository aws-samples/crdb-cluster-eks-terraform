# Create new namespace if does not exist
resource "kubernetes_namespace" "namespace" {
  metadata {
    name = local.namespace
    annotations = {
      name = local.namespace
    }
  }

  lifecycle {
    # prevent_destroy = true
    ignore_changes = [
      metadata.0.annotations["cattle.io/status"],
      metadata.0.annotations["lifecycle.cattle.io/create.namespace-auth"],
      metadata.0.annotations["field.cattle.io/projectId"],
      metadata.0.annotations["management.cattle.io/no-default-sa-token"],
      metadata.0.labels["field.cattle.io/projectId"]
    ]
  }
}

resource "kubernetes_storage_class" "gp3" {
  metadata {
    name = "gp3"
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
  parameters          = merge({ "type" : "gp3", "iops" : "3000" }, local.storage_tags)
}

# Create the required certificates using cert-manager. It should be installed with the EKS cluster
data "template_file" "certificate_file" {
  for_each = fileset(local.certificate_manifest_directory, "*.yaml")
  template = file("${local.certificate_manifest_directory}/${each.key}")
}

resource "kubectl_manifest" "cert" {
  for_each           = data.template_file.certificate_file
  yaml_body          = each.value.rendered
  override_namespace = kubernetes_namespace.namespace.metadata[0].name
}

# Create Node Certificate

data "template_file" "node_certificate" {
  template = file(local.node_certificate_file)
  vars = {
    namespace    = local.namespace
    crdb_cluster = "cockroachdb"
  }
}

resource "kubectl_manifest" "node_certificate" {
  yaml_body          = data.template_file.node_certificate.rendered
  override_namespace = kubernetes_namespace.namespace.metadata[0].name
  depends_on = [
    kubectl_manifest.cert
  ]
}


# Install the custom resource definition file for CRDB
resource "kubectl_manifest" "crd" {
  yaml_body = file(local.crd_manifest_file)
}

# Install CRDB operator

data "template_file" "operator" {
  for_each = fileset(local.operator_manifest_directory, "*.yaml")
  template = file("${local.operator_manifest_directory}/${each.key}")
  vars = {
    operator_namespace = "cockroach-operator-system"
    namespace_to_watch = kubernetes_namespace.namespace.metadata[0].name

  }
}

resource "kubectl_manifest" "operator" {
  for_each  = data.template_file.operator
  yaml_body = each.value.rendered
}

# Wait for the operator to finish the processing
resource "time_sleep" "operator_wait" {
  depends_on      = [kubectl_manifest.operator]
  create_duration = "10s"
}

# Create CRDB database

data "template_file" "database" {
  template = file(local.database_manifest_file)

  vars = {
    number_of_nodes        = var.number_of_nodes
    cpu_requests           = var.cpu_requests
    memory_request         = var.remory_request
    cpu_limit              = var.cpu_limit
    memory_limit           = var.memory_limit
    persistent_volume_size = var.persistent_volume_size
    max_sql_memory         = var.max_sql_memory
    region                 = data.aws_region.current.id
    max-disk-temp-storage  = var.max-disk-temp-storage
    storageClassName       = "gp3"
    # crdb_cluster           = var.crdb_cluster
  }
}

resource "kubectl_manifest" "database" {
  yaml_body          = data.template_file.database.rendered
  override_namespace = kubernetes_namespace.namespace.metadata[0].name

  depends_on = [
    kubectl_manifest.operator,
    kubectl_manifest.cert,
    time_sleep.operator_wait,
    kubernetes_storage_class.gp3
  ]
}


# Wait for database to come up so that the service roles will be created properly.
resource "time_sleep" "database_wait" {
  depends_on      = [kubectl_manifest.database]
  create_duration = "15s"
}

# Create the secure client to access the database
data "template_file" "client" {
  # count              = var.deploy_client ? 1 : 0
  template = file(local.client_manifest_file)
  vars = {
    serviceaccount = "cockroachdb-sa"
  }
}

resource "kubectl_manifest" "client" {
  count              = var.deploy_client ? 1 : 0
  yaml_body          = data.template_file.client.rendered
  override_namespace = kubernetes_namespace.namespace.metadata[0].name
  depends_on = [
    kubectl_manifest.database,
    kubectl_manifest.cert,
    time_sleep.database_wait
  ]
}

# Create a service which will create NLB with domain name in annotation
data "template_file" "nlb" {
  template = file(local.nlb_manifest_file)
  vars = {
    dnsname         = "${var.namespace}-crdb-${data.aws_region.current.id}.${var.domainname}"
    additional_tags = join(",", setunion(local.additional_tags, ["env=${var.namespace}"]))
    crdb_cluster    = "cockroachdb"
  }
}

resource "kubectl_manifest" "nlb" {
  yaml_body          = data.template_file.nlb.rendered
  override_namespace = kubernetes_namespace.namespace.metadata[0].name
  depends_on = [
    kubectl_manifest.database,
    time_sleep.database_wait,
    kubectl_manifest.cert
  ]
}


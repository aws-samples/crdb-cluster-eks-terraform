locals {
  crd_manifest_file              = var.crd_manifest_file == "" ? "${path.module}/manifest/crds.yaml" : var.crd_manifest_file
  database_manifest_file         = var.database_manifest_file == "" ? "${path.module}/manifest/database.yaml" : var.database_manifest_file
  nlb_manifest_file              = var.nlb_manifest_file == "" ? "${path.module}/manifest/nlb.yaml" : var.nlb_manifest_file
  client_manifest_file           = var.client_manifest_file == "" ? "${path.module}/manifest/client-secure-operator.yaml" : var.client_manifest_file
  namespace                      = var.namespace
  operator_namespace             = "cockroach-operator-system"
  operator_manifest_directory    = var.operator_manifest_directory == "" ? "${path.module}/manifest/operator" : var.operator_manifest_directory
  certificate_manifest_directory = var.certificate_manifest_directory == "" ? "${path.module}/manifest/certificate" : var.certificate_manifest_directory
  node_certificate_file          = var.node_certificate_file == "" ? "${path.module}/manifest/node_certificate.yaml" : var.node_certificate_file
  additional_tags                = formatlist("%s=%s", keys(var.additional_tags), values(var.additional_tags))

  storage_tags = {
    for index, key in keys(merge({ "env" : var.namespace }, var.additional_tags)) :
    "tagSpecification_${index + 1}" => "${key}=${merge({ "env" : var.namespace }, var.additional_tags)[key]}"
  }
  cluster_settings_file = var.cluster_settings_file == "" ? "${path.module}/manifest/cmd.txt" : var.cluster_settings_file
}
# output "database_rendered" {
#   value = data.template_file.database.rendered
# }

# output "node_cert" {
#   value = data.template_file.node_certificate.rendered
# }

# output "namespace" {
#   value = kubernetes_namespace.namespace.metadata[0].name
# }

# output "dnsname" {
#   value = local.dnsname
# }

# output "sdf" {
#   value = kubernetes_storage_class.gp3.metadata[0].name
# }

# output "tag" {
#   value = local_file.cluster_settings.content
# }
# output "dir" {
#   value = local.certificate_manifest_directory
# }
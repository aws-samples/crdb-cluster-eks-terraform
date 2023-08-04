resource "kubernetes_storage_class" "example" {
  metadata {
    name = "gp3"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  volume_binding_mode = "WaitForFirstConsumer"
  parameters = {
    type = "gp3"
      tagSpecification_1: "key1=value100,key2=value200"
      tagSpecification_2: "key3=value300"
  }
}
variable "region" {
  description = "set the region for deployment"
  default     = "us-west-1"
}

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  default     = "mycrdb1"
}

variable "number_of_nodes" {
  description = "Number of nodes to be deployed"
  default     = 3
}

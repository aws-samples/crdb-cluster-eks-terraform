variable "region" {
  description = "set the region for deployment"
  default     = "us-east-2"
}

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  default     = "demo"
}

variable "number_of_nodes" {
  description = "Number of nodes to be deployed"
  default     = 3
}

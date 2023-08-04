terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.8"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.id, "--region", var.region]
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.id, "--region", var.region]
    }
  }
}

data "aws_region" "current" {}
module "common-tags" {
  source = "../modules/common-tags"
}
provider "aws" {
  region = var.region
}
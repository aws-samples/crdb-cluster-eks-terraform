data "aws_region" "current" {}
module "common-tags" {
  source = "../modules/common-tags"
}
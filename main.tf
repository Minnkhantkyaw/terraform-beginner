terraform {

}

# https://developer.hashicorp.com/terraform/language/modules/sources
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # pass in any vars you need
  UUID            = var.UUID
  s3_bucket_name  = var.s3_bucket_name
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
  content_version = var.content_version
}

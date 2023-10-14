terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

# https://developer.hashicorp.com/terraform/language/modules/sources
# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   # pass in any vars you need
#   UUID            = var.UUID
#   s3_bucket_name  = var.s3_bucket_name
#   index_html_path = var.index_html_path
#   error_html_path = var.error_html_path
#   content_version = var.content_version
#   assets_path = var.assets_path
# }

}

provider "terratowns" {
  endpoint  = "https://localhost:4567"
  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
  token     = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

resource "terratowns_home" "morton_manor" {
  name = "How to play A in 2023"
  description = <<DOC
This is a better description on how to play A in the year 2023.
  DOC
  town = "missingo"
  content_version = 1
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3e8u1j4b.cloudfront.net"
}
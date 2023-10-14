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
#   UUID            = var.teacherseat_user_uuid
#   s3_bucket_name  = var.s3_bucket_name
#   index_html_path = var.index_html_path
#   error_html_path = var.error_html_path
#   content_version = var.content_version
#   assets_path = var.assets_path
# }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid=var.teacherseat_user_uuid
  token=var.terratowns_access_token
}

resource "terratowns_home" "home" {
  name = "Morton Manor Tiny House"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fdq3gz23.cloudfront.net"
  town = "missingo"
  content_version = 1
}
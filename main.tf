terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

# https://developer.hashicorp.com/terraform/language/modules/sources
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # pass in any vars you need
  UUID = var.teacherseat_user_uuid
  # s3_bucket_name  = aws_s3_bucket.example.id
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
  content_version = var.content_version
  assets_path     = var.assets_path
}


provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

resource "terratowns_home" "home" {
  name        = "Morton Manor Tiny House"
  description = <<DESCRIPTION
My Tiny House has 264 sq ft, on a 24 ft flatbed trailers.  I moved it from TX to OR
about a year ago.  It has a functional bathroom (toilet and shower) though my water 
heater is no malfunctioning!  I can cook and wash dishes, has storage for my belonging,
and my clothes.  I want to build a fold out couch to allow me to sleep downstairs
during the hotter part of the year.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz23.cloudfront.net"
  town            = "the-nomad-pad"
  content_version = 1
}


# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   # pass in any vars you need
#   UUID = var.teacherseat_user_uuid
#   # s3_bucket_name  = aws_s3_bucket.example.id
#   index_html_path = var.index_html_path
#   error_html_path = var.error_html_path
#   content_version = var.content_version
#   assets_path     = var.assets_path
# }

# resource "terratowns_home" "cottage" {
#   name        = "Columbia Cottage"
#   description = <<DESCRIPTION
# This is a 2nd, ficitional, tiny house on wheels.  It would be built on a goose-neck trailer and 
# would only be 9-10 feet tall but on a least a 20ft trailer. It would be more movable than Morton Manor.
# I may also consider to be put on a 16ft trail
# DESCRIPTION
#   domain_name = module.terrahouse_aws.cloudfront_url
#   #domain_name = "3fdq3gz23.cloudfront.net"
#   town            = "the-nomad-pad"
#   content_version = 1
# }
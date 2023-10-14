terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

# https://developer.hashicorp.com/terraform/language/modules/sources


#  Morton Manor Tiny House
module "morton_manor" {
  source = "./modules/terrahome_aws"
  # pass in any vars you need
  UUID = var.teacherseat_user_uuid
  # s3_bucket_name  = aws_s3_bucket.example.id
  public_path = var.mortonmanor_public_path
  # index_html_path = var.index_html_path
  # error_html_path = var.error_html_path
  # assets_path     = var.assets_path
  content_version = var.content_version
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
  domain_name = module.morton_manor.domain_name
  #domain_name = "3fdq3gz23.cloudfront.net"
  town            = "the-nomad-pad"
  content_version = 1
}


# Columbia Cottage Tiny House

# module "columbia_cottage" {
#   source = "./modules/terrahome_aws"
#   # pass in any vars you need
#   UUID = var.teacherseat_user_uuid
#   # s3_bucket_name  = aws_s3_bucket.example.id
#   public_path = var.columbiacottage_public_path
#   # index_html_path = var.index_html_path
#   # error_html_path = var.error_html_path
#   # assets_path     = var.assets_path
#   # content_version = var.content_version
# }

# resource "terratowns_home" "cottage" {
#   name        = "Columbia Cottage"
#   description = <<DESCRIPTION
# This is a 2nd, ficitional, tiny house on wheels.  It would be built on a goose-neck trailer and 
# would only be 9-10 feet tall but on a least a 20ft trailer. It would be more movable than Morton Manor.
# I may also consider to be put on a 16ft trail
# DESCRIPTION
#   domain_name = module.columbia_cottage.domain_name
#   #domain_name = "3fdq3gz23.cloudfront.net"
#   town            = "the-nomad-pad"
#   content_version = 1
# }
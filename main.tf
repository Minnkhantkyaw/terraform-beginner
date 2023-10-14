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
  public_path = var.morton_manor.public_path
  content_version = var.morton_manor.content_version
}

resource "terratowns_home" "morton_manor" {
  name        = "Morton Manor Tiny House"
  description = <<DESCRIPTION
My Tiny House is 264 sq ft, on a 24 ft flatbed trailer. I moved it from TX to OR
about a year ago. It has a functional bathroom (toilet and shower, sink coming) though my water 
heater is malfunctioning! I can cook and wash dishes, has storage for my belongings,
tools and clothes. I want to build a pull-out couch to allow me to sleep downstairs
during the hotter part of the year. I also want space for a Labrador. I miss having a dog!
DESCRIPTION
  domain_name = module.morton_manor.domain_name
  #domain_name = "3fdq3gz23.cloudfront.net"
  town            = "the-nomad-pad"
  content_version = var.morton_manor.content_version
}


# Columbia Cottage Tiny House

# module "columbia_cottage" {
#   source = "./modules/terrahome_aws"
#   # pass in any vars you need
#   UUID = var.teacherseat_user_uuid
#   # s3_bucket_name  = aws_s3_bucket.example.id
#   public_path = var.columbia_cottage_public_path
#   # index_html_path = var.index_html_path
#   # error_html_path = var.error_html_path
#   # assets_path     = var.assets_path
    # content_version = var.columbia_cottage.content_version
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
#   content_version = var.columbia_cottage.content_version
# }
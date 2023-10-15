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
  town            = "the-nomad-pad"
  content_version = var.morton_manor.content_version
}


# Columbia Cottage Tiny House
module "columbia_cottage" {
  source = "./modules/terrahome_aws"
  # pass in any vars you need
  UUID = var.teacherseat_user_uuid
  public_path = var.columbia_cottage.public_path
  content_version = var.columbia_cottage.content_version
}

resource "terratowns_home" "columbia_cottage" {
  name        = "Columbia Cottage Tiny House"
  description = <<DESCRIPTION
I would build a 2nd time on a goose-neck trailer if I get the funds. It would only be 9-10 feet tall 
but on a least a 20ft trailer. It would be more movable than Morton Manor.
I may also consider to be put on a 16ft trailer.  The bedroom would be on the gooseneck part of the 
trailer. I could see having a 2nd bedroom/sleeping area/loft
DESCRIPTION
  domain_name = module.columbia_cottage.domain_name
  town            = "the-nomad-pad"
  content_version = var.columbia_cottage.content_version
}
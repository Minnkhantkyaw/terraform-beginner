terraform {
  cloud {
    organization = "TerraTowns"
      workspaces {
        name = "TerraHouse"
      }
  }

  # required_providers {
  #   #   random = {
  #   #     source  = "hashicorp/random"
  #   #     version = "3.5.1"
  #   #   }

  #   aws = {
  #     source  = "hashicorp/aws"
  #     version = "5.17.0"
  #   }
  # }
}

provider "aws" {
  # Configuration options
  #   region     = "us-west-2"
  #   access_key = "my-access-key"
  #   secret_key = "my-secret-key"
}

# provider "random" {
#   # Configuration options
# }

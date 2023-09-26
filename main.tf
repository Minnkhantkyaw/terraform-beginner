#First Change
#Second Change

terraform {
  
  cloud {
    organization = "TerraTowns"

    workspaces {
      name = "TerraHouse"
    }
  
}
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {

}

provider "random" {
  # Configuration options
}

resource "random_string" "s3_bucket_name" {
  length  = 16
  special = false
  upper   = false
  lower   = true
  numeric = true
  #override_special = "/@£$" 
}

output "s3_bucket_name_id" {
  description = "random S3 Bucket name"
  value       = random_string.s3_bucket_name.id
}


resource "aws_s3_bucket" "example" {
  bucket = random_string.s3_bucket_name.id

  # tags = {
  #   Name        = "My bucket"
  #   Environment = "Dev"
  # }
}
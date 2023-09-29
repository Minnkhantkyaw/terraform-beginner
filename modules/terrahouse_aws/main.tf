terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
# provider "aws" {
#   # Configuration options
#   #   region     = "us-west-2"
#   #   access_key = "my-access-key"
#   #   secret_key = "my-secret-key"
# }

resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name

  tags = {
    UUID = var.UUID
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
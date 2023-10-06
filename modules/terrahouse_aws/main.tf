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
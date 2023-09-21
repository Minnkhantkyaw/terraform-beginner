#First Change
#Second Change

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "s3_bucket_name" {
  length  = 16
  special = false
  #override_special = "/@£$" 
}

output "s3_bucket_name_id" {
  description = "random S3 Bucket name"
  value       = random_string.s3_bucket_name.id
}

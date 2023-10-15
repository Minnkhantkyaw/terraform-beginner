#main/output.terraform 

output "s3_bucket_name" {
  description = "This is the name of our bucket that will host our website"
  value       = module.morton_manor.s3_bucket_name
}

output "UUID" {
  description = "This is the uniquie tag of our bucket"
  value       = module.morton_manor.UUID
}

output "s3bucket_website" {
  description = "the value of the website/url that is produced for the s3 bucket."
  value       = module.morton_manor.s3bucket_website
}

output "cloudfront_url" {
  description = "The URL for the CloudFront distribution"
  value       = module.morton_manor.domain_name
}

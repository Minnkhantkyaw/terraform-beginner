output "s3_bucket_name" {
  description = "Value that is unique."
  value       = aws_s3_bucket.example.id
}

output "UUID" {
  description = "Value that is unique."
  value       = var.UUID
}

output "s3bucket_website" {
  description = "the value of the website/url that is produced for the s3 bucket."
  value       = aws_s3_bucket_website_configuration.s3website.website_endpoint
}

output "domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution

locals {
    s3_origin_id = "MyS3Origin"
  }

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control
resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "OAC for ${aws_s3_bucket.example.id}"
  description                       = "Origin Access Control for S3 Static Website for ${aws_s3_bucket.example.id}."
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.example.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static Website from S3 bucket ${aws_s3_bucket.example.id}"
  default_root_object = "index.html"

  # aliases = ["mysite.example.com", "yoursite.example.com"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"
  # retain_on_delete = false

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    UUID = var.UUID
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

# # This code will invalidate old version of the index/error html files
# when they are updated/changed. 

resource "terraform_data" "invalidate_cache" {
  triggers_replace = terraform_data.content_version.output

  provisioner "local-exec" {
    command = <<-EOF
    aws cloudfront create-invalidation \
    --distribution-id ${aws_cloudfront_distribution.s3_distribution.id} \
    --paths "/*"
      EOF
    }
}
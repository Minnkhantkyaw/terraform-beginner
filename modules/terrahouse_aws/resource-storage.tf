resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name

  tags = {
    UUID = var.UUID
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console

# Website with S3 bucket 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration

resource "aws_s3_bucket_website_configuration" "s3website" {
  bucket = aws_s3_bucket.example.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
 }

# uploade a file to the s3 bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object

 resource "aws_s3_object" "index" {
  bucket = var.s3_bucket_name
  key    = "index.html"
  source = var.index_html_path
  content_type = "text/html"

  etag = filemd5(var.index_html_path)
}

 resource "aws_s3_object" "error" {
  bucket = var.s3_bucket_name
  key    = "error.html"
  source = var.error_html_path
  content_type = "text/html"

  etag = filemd5(var.error_html_path)
 }

# Bucket policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.example.id
  # policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode ({
    "Version" = "2012-10-17",
    "Statement" = [
        {
            "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
            "Effect" = "Allow",
            "Principal" = {
                "Service" = "cloudfront.amazonaws.com"
            },
            "Action" = "s3:GetObject",
            "Resource" = "arn:aws:s3:::${aws_s3_bucket.example.id}/*",
            "Condition" = {
                "StringEquals" = {
                    "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
                }
            }
        },
      ]
})
}

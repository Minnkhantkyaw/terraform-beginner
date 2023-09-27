resource "random_string" "s3_bucket_name" {
  length  = 16
  special = false
  upper   = false
  lower   = true
  numeric = true
  #override_special = "/@£$" 
}
resource "aws_s3_bucket" "example" {
  bucket = random_string.s3_bucket_name.id

  tags = {
    UserUUID = ""
  }
}
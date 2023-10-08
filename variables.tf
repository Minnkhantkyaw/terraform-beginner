variable "UUID" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "index_html_path" {
  type = string
}

variable "error_html_path" {
  type = string
}

variable "content_version" {
  description = "Version number for your content"
  type        = number
}
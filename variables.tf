variable "UUID" {
  type = string
}

variable "terratowns_access_token" {
  type = string
}

variable "terratowns_endpoint" {
  type = string
}

variable "teacherseat_user_uuid" {
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

variable "assets_path" {
  type        = string
  description = "Path to the assets folder"
}
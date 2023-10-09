variable "UUID" {
  description = "An example input variable with UUID validation"
  type        = string
  #default     = "0071972e-6023-468b-9eab-4f109beb9e81"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.UUID))
    error_message = "example_uuid must be a valid UUID. /modules/terrahouse_aws/variables.tf"
  }
}

variable "s3_bucket_name" {
  type    = string
  #default = "m2g094yvm028oas0"
}

variable "index_html_path" {
  type        = string
  description = "Path to the index.html file"

  validation {
    condition     = fileexists(var.index_html_path)
    error_message = "The specified path does not exist."
  }
}

variable "error_html_path" {
  type        = string
  description = "Path to the error.html file"

  validation {
    condition     = fileexists(var.error_html_path)
    error_message = "The specified path does not exist."
  }
}

variable "assets_path" {
  type        = string
  description = "Path to the assets folder"
}
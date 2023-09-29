variable "UUID" {
  description = "An example input variable with UUID validation"
  type        = string
  default     = "0071972e-6023-468b-9eab-4f109beb9e81"


  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.UUID))
    error_message = "example_uuid must be a valid UUID."
  }
}

variable s3_bucket_name {
  type= string
  default = "m2g094yvm028oas0"
}
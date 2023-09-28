variable "UUID" {
  description = "An example input variable with UUID validation"
  type        = string
  


  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.UUID))
    error_message = "example_uuid must be a valid UUID."
  }
}
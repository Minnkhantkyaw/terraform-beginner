variable "UserUUID" {
  description = "The User UUID"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$", var.UserUUID))
    error_message = "Invalid UserUUID format. It should be a valid UUID."
  }
}

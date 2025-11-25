

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable or disable versioning for S3 bucket"
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "Allow bucket to be deleted even if not empty"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "bucket_name" {
  type        = string
  description = "The Name of Your S3 Bucket"
}

variable "force_destroy" {
  type        = bool
  default     = true
  description = "Cleans up the bucket and all items. Use Carefully!"
}

variable "bucket_tags" {
  type        = map(string)
  description = "Tags to apply to the S3 bucket"
  default = {
    "Data Clasification" = "GDPR"
    "Data Owner"         = "Bucket Owner"
  }
}

variable "versioning_status" {
  type    = string
  default = "Enabled"
}

variable "kmskey_description" {
  type    = string
  default = "This key is used to encrypt bucket objects"
}

variable "kmskey_key_rotation" {
  type    = bool
  default = true
}

variable "kmskey_rotation_period" {
  type    = number
  default = 365
}

variable "kms_alias_name" {
  type    = string
  default = "alias/s3-kms-alias"
}

variable "sse_algorithm" {
  type    = string
  default = "aws:kms"
}

variable "bucket_key_enabled" {
  type    = string
  default = "true"
}
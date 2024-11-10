##########################################################
# S3 Bucket
##########################################################

resource "aws_s3_bucket" "s3_bucket_example" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags          = var.bucket_tags
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3_bucket_example.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_kms_key" "kmskey" {
  description             = var.kmskey_description
  enable_key_rotation     = var.kmskey_key_rotation
  rotation_period_in_days = var.kmskey_rotation_period
}

resource "aws_kms_alias" "kmsalias" {
  name          = var.kms_alias_name
  target_key_id = aws_kms_key.kmskey.id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.s3_bucket_example.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kmskey.arn
      sse_algorithm     = var.sse_algorithm
    }
    bucket_key_enabled = var.bucket_key_enabled
  }
}

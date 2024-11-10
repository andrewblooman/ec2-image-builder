variable "instance_types" {
  type = list(string)
  default = ["t2.nano", "t3.micro"]
}

variable "security_group_ids" {
  type = list(string)
}

variable "description" {
  type = string
  default = "Infrastructure Configuration"
}

variable "instance_profile_name" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "name" {
  type = string
  default = "Golden Image Pipeline Infrastructure Configuration"
}

variable "sns_topic_arn" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "terminate_instance_on_failure" {
  type = bool
  default = true
}

variable "s3_bucket_name" {
  type = string
}

variable "s3_key_prefix" {
  type = string
  default = "logs"
}
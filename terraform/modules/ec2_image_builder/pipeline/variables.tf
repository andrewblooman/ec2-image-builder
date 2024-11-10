variable "image_pipeline_name" {
  type = string
}

variable "image_scanning_enabled" {
  type    = bool
  default = false
}

variable "schedule_expression" {
  type    = string
  default = "cron(0 0 * * ? *)"
}

variable "image_recipe_arn" {
  description = "The ARN of the Image Builder recipe to use in the pipeline"
  type        = string
}

variable "infrastructure_configuration_arn" {
  type = string
}
resource "aws_imagebuilder_image_pipeline" "golden_image" {
  image_recipe_arn                 = var.image_recipe_arn
  infrastructure_configuration_arn = var.infrastructure_configuration_arn
  name                             = var.image_pipeline_name
  image_scanning_configuration {
    image_scanning_enabled = var.image_scanning_enabled
  }
  schedule {
    schedule_expression = var.schedule_expression
  }
}
output "image_recipe_arn" {
  description = "The ARN of the Image Builder recipe"
  value       = aws_imagebuilder_image_recipe.golden_image.arn
}